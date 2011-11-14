//
//  GoogleMapTileOperation.m
//  TestGoogleMap
//
//  Created by iphone4 on 10-12-16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GoogleMapTileOperation.h"

int tn(int n)//计算2的n次方
{
	int num = 1;
	int i = 0;
	for (i=0; i<n; i++) {
		num = num *2;
	}
	return num;
}
@implementation GoogleMapTileOperation
@synthesize tile=_tile;
@synthesize target=_target;
@synthesize action=_action;

- (id)initWithTile:(AGSTile *)tile  target:(id)target action:(SEL)action {
	
	if (self = [super init]) {
		self.target = target;
		self.action = action;
		self.tile = tile;
		
	}
	return self;
}

-(void)main {
	//Fetch the tile for the requested Level, Row, Column
	@try {
		//Level ('L' followed by 2 digits)
		NSString *baseUrl = [NSString stringWithFormat:@"http://khm%d.google.com/kh/v=76&x=%d&s=&y=%d&z=%d&s=G",(self.tile.column+self.tile.row+self.tile.level)%4,self.tile.column,self.tile.row,self.tile.level];
		if (self.tile.row >=tn(self.tile.level)) {
			NSLog(@"11");
			return;
		}
		NSURL* aURL = [NSURL URLWithString:baseUrl];
		NSData* data = [[NSData alloc] initWithContentsOfURL:aURL];
		_tile.image = [UIImage imageWithData:data];
		
		[data release];
		NSLog(baseUrl);
		
	}
	@catch (NSException *exception) {
		NSLog(@"main: Caught Exception %@: %@", [exception name], [exception reason]);
	}
	@finally {
		//Invoke the layer's action method
		[_target performSelector:_action withObject:self];
	}
}

- (void)dealloc {
	self.target = nil;
	self.action = nil;
	self.tile = nil;
	[super dealloc];	
}

@end
