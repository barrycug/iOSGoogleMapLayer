//
//  GoogleMapSchema.m
//  TestGoogleMap
//
//  Created by iphone4 on 10-12-16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GoogleMapSchema.h"
#import "ArcGIS.h"

@implementation GoogleMapSchema

@synthesize spatialReference = spatialReference;
@synthesize fullEnvelope = fullEnvelope;
@synthesize tileInfo = tileInfo;
-(id) init
{
	[super init];
 	self.spatialReference = [[AGSSpatialReference alloc] initWithWKID:102100 WKT:nil];
	self.fullEnvelope = [[AGSEnvelope alloc] initWithXmin:-22041257.773878
												 ymin:-32673939.6727517
												 xmax:22041257.773878
												 ymax:20851350.0432886
									 spatialReference:self.spatialReference];
		
	NSMutableArray *lods = [NSMutableArray arrayWithObjects:
					 [[AGSLOD alloc] initWithLevel:0 resolution:156543.03392800014 scale: 591657527.591555],
					 [[AGSLOD alloc] initWithLevel:1 resolution:78271.516963999937 scale: 295828763.79577702],
					 [[AGSLOD alloc] initWithLevel:2 resolution:39135.758482000092 scale: 147914381.89788899],
					 [[AGSLOD alloc] initWithLevel:3 resolution:19567.879240999919 scale: 73957190.948944002],
					 [[AGSLOD alloc] initWithLevel:4 resolution:9783.9396204999593 scale: 36978595.474472001],
					 [[AGSLOD alloc] initWithLevel:5 resolution:4891.9698102499797 scale: 18489297.737236001],
					 [[AGSLOD alloc] initWithLevel:6 resolution:2445.9849051249898 scale: 9244648.8686180003],
					 [[AGSLOD alloc] initWithLevel:7 resolution:1222.9924525624949 scale: 4622324.4343090001],
					 [[AGSLOD alloc] initWithLevel:8 resolution:611.49622628138 scale: 2311162.217155],
					 [[AGSLOD alloc] initWithLevel:9 resolution:305.748113140558 scale: 1155581.108577],
					 [[AGSLOD alloc] initWithLevel:10 resolution:152.874056570411 scale: 577790.554289],
					 [[AGSLOD alloc] initWithLevel:11 resolution:76.4370282850732 scale: 288895.277144],
					 [[AGSLOD alloc] initWithLevel:12 resolution:38.2185141425366 scale: 144447.638572],
					 [[AGSLOD alloc] initWithLevel:13 resolution:19.1092570712683 scale: 72223.819286],
					 [[AGSLOD alloc] initWithLevel:14 resolution:9.55462853563415 scale:36111.909643],
					 [[AGSLOD alloc] initWithLevel:15 resolution:4.7773142679493699 scale: 18055.954822],
					 [[AGSLOD alloc] initWithLevel:16 resolution:2.3886571339746849 scale: 9027.9774109999998],
					 [[AGSLOD alloc] initWithLevel:17 resolution:1.1943285668550503 scale: 4513.9887049999998],
					 [[AGSLOD alloc] initWithLevel:18 resolution:0.59716428355981721 scale: 2256.994353],
					 [[AGSLOD alloc] initWithLevel:19 resolution:0.29858214164761665 scale: 1128.4971760000001],
					 nil ];
	self.tileInfo = [[AGSTileInfo alloc] 
				 initWithDpi:96 
				 format :@"JPEG"
				 lods:lods
				 origin:[AGSPoint pointWithX:-20037508.342787 y:20037508.342787 spatialReference:self.spatialReference]
				 spatialReference :self.spatialReference
				 tileSize:CGSizeMake(256,256)
				 ];
	[self.tileInfo computeTileBounds:self.fullEnvelope ];
	return self;
}
- (void)dealloc {
	self.spatialReference = nil;
	self.fullEnvelope = nil;
	self.tileInfo = nil;

	[super dealloc];	
}
@end
