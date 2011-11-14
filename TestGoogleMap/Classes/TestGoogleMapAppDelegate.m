//
//  TestGoogleMapAppDelegate.m
//  TestGoogleMap
//
//  Created by iphone4 on 10-12-16.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TestGoogleMapAppDelegate.h"
#import "TestGoogleMapViewController.h"

@implementation TestGoogleMapAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
