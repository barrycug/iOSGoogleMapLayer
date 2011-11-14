//
//  AGSGoogleMapLayer.h
//  TestGoogleMap
//
//  Created by iphone4 on 10-12-16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArcGIS.h"

@interface AGSGoogleMapLayer : AGSTiledLayer 
{
	AGSTileInfo* _tileInfo;
	AGSEnvelope* _fullEnvelope;	
	AGSUnits _units;

}
-(id)initWithGoogleMapSchema;
@end
