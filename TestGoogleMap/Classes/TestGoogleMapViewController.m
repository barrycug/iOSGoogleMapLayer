//
//  TestGoogleMapViewController.m
//  TestGoogleMap
//
//  Created by iphone4 on 10-12-16.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TestGoogleMapViewController.h"
#import "AGSGoogleMapLayer.h"

#define kTiledEMapZoneMapServiceURL @"http://service.emapzone.com/arcgis/config=MAPARCGIS&a_k=634a857279d11f4eb8dfda4418dad0676349429f0db9226d9d17d06666242a82f70124097387bff8/rest/services/China-web/MapServer"


@implementation TestGoogleMapViewController

@synthesize mapView=_mapView;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	/* ##################################################### */
	// TODO
	// Replace the following block of code with your own.
	//
	AGSTiledMapServiceLayer *tiledLayer = [[AGSTiledMapServiceLayer alloc] initWithURL:[NSURL URLWithString:kTiledEMapZoneMapServiceURL ]];	
	[self.mapView addMapLayer:tiledLayer withName:@"Tiled Layer3"];
	AGSGoogleMapLayer * googleMapLayer = [[AGSGoogleMapLayer alloc] initWithGoogleMapSchema];
//	NSURL *mapUrl = [NSURL URLWithString:@"http://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer"];
//	AGSTiledMapServiceLayer *tiledLyr = [AGSTiledMapServiceLayer tiledMapServiceLayerWithURL:mapUrl];
	[self.mapView addMapLayer:googleMapLayer withName:@"Tiled Layer"];
	
//	AGSSpatialReference *sr = [AGSSpatialReference spatialReferenceWithWKID:102100];
//	AGSEnvelope *env = [AGSEnvelope envelopeWithXmin:-13626513.829723023 
//												ymin:4549088.827634182 
//												xmax:-13626131.64458163 
//												ymax:4549638.218774935 
//									spatialReference:sr];
//	[self.mapView zoomToEnvelope:env animated:YES];
	/* ##################################################### */
	AGSEnvelope *env = [AGSEnvelope envelopeWithXmin:12836931.118569 ymin:4773566.12743336 xmax:13092266.2487341 ymax:5033121.81554815 spatialReference:[AGSSpatialReference spatialReferenceWithWKID:102113]];
	[self.mapView zoomToEnvelope:env animated:YES];


}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	self.mapView = nil;
    [super dealloc];
}

@end
