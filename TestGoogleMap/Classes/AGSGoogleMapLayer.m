//
//  AGSGoogleMapLayer.m
//  TestGoogleMap
//
//  Created by iphone4 on 10-12-16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AGSGoogleMapLayer.h"
#import "GoogleMapSchema.h"
#import "GoogleMapTileOperation.h"
int MakeAGSUnits(NSString* wkt){
	NSString* value ;
	BOOL _continue = YES;
 	NSScanner* scanner = [NSScanner scannerWithString:wkt];
	//Scan for the UNIT information in WKT. 
	//If WKT is for a Projected Coord System, expect two instances of UNIT, and use the second one
	while (_continue) {
		[scanner scanUpToString:@"UNIT[\"" intoString:NULL];
		[scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"UNIT[\""]];
		_continue = [scanner scanUpToString:@"\"" intoString:&value];
	}
	if([@"Foot_US" isEqualToString:value] || [@"Foot" isEqualToString:value]){
		return AGSUnitsFeet;
	}else if([@"Meter" isEqualToString:value]){
		return AGSUnitsMeters;
	}else if([@"Degree" isEqualToString:value]){
		return AGSUnitsDecimalDegrees;
	}else{
		//TODO: Not handling other units like Yard, Chain, Grad, etc
		return -1;
	}
}


@implementation AGSGoogleMapLayer

-(AGSUnits)units{
	return _units;
}

-(AGSSpatialReference *)spatialReference{
	return _fullEnvelope.spatialReference;
}

-(AGSEnvelope *)fullEnvelope{
	return _fullEnvelope;
}

-(AGSEnvelope *)initialEnvelope{
	//Assuming our initial extent is the same as the full extent
	return _fullEnvelope;
}

-(AGSTileInfo*) tileInfo{
	return _tileInfo;
}
#pragma mark -

-(id)initWithGoogleMapSchema
{
	GoogleMapSchema * shema = [[GoogleMapSchema alloc] init];
	_tileInfo = [shema.tileInfo retain];
//	NSLog([NSString stringWithFormat:@"l=%d",[_tileInfo.lods count]]);
	_fullEnvelope = [shema.fullEnvelope retain];
	//	_units = MakeAGSUnits(_fullEnvelope.spatialReference.wkt);
	[self layerDidLoad];
	return self;
	
}
- (NSOperation<AGSTileOperation>*) retrieveImageAsyncForTile:(AGSTile *) tile{
	//Create an operation to fetch tile from local cache
	GoogleMapTileOperation *operation = 
	[[GoogleMapTileOperation alloc] initWithTile:tile
										target:self 
										action:@selector(didFinishOperation:)];
	//Add the operation to the queue for execution
    [super.operationQueue addOperation:operation];
	NSLog([NSString stringWithFormat:@"x=%d y=%d z=%d",tile.row,tile.column,tile.level]);
    return [operation autorelease];
}

- (void) didFinishOperation:(NSOperation<AGSTileOperation>*)op {
	//If tile was found ...
	if (op.tile.image!=nil) {
		//... notify tileDelegate of success
		[self.tileDelegate tiledLayer:self operationDidGetTile:op];
	}else {
		//... notify tileDelegate of failure
		[self.tileDelegate tiledLayer:self operationDidFailToGetTile:op];
		NSLog([NSString stringWithFormat:@"faildop"]);
	}
}

#pragma mark -
- (void)dealloc {

	[_fullEnvelope release];
	[_tileInfo release];
    [super dealloc];
}

@end
