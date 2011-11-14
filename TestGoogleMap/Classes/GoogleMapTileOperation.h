//
//  GoogleMapTileOperation.h
//  TestGoogleMap
//
//  Created by iphone4 on 10-12-16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ArcGIS.h"

@interface GoogleMapTileOperation : NSOperation <AGSTileOperation> {

@private
	id _target;
	SEL _action;
	AGSTile* _tile;
}

- (id)initWithTile:(AGSTile *)tile  target:(id)target action:(SEL)action;


@property (nonatomic,retain) AGSTile* tile;
@property (nonatomic,retain) id target;
@property (nonatomic,assign) SEL action;
@end
