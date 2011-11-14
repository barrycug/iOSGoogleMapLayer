//
//  GoogleMapSchema.h
//  TestGoogleMap
//
//  Created by iphone4 on 10-12-16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AGSPoint;
@class AGSLOD;
@class AGSSpatialReference;
@class AGSTileInfo;
@class AGSEnvelope;
@interface GoogleMapSchema : NSObject {
	AGSSpatialReference* spatialReference;
	AGSEnvelope* fullEnvelope;
	AGSTileInfo* tileInfo;
	
}

@property (nonatomic,retain,readwrite) AGSSpatialReference* spatialReference;
@property (nonatomic,retain,readwrite) AGSEnvelope* fullEnvelope;
@property (nonatomic,retain,readwrite) AGSTileInfo* tileInfo;
@end
