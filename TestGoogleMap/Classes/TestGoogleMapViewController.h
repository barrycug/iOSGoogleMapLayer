//
//  TestGoogleMapViewController.h
//  TestGoogleMap
//
//  Created by iphone4 on 10-12-16.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArcGIS.h"

@interface TestGoogleMapViewController : UIViewController {
	AGSMapView *_mapView;
}

@property (nonatomic, retain) IBOutlet AGSMapView *mapView;

@end

