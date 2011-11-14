//
//  TestGoogleMapAppDelegate.h
//  TestGoogleMap
//
//  Created by iphone4 on 10-12-16.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestGoogleMapViewController;

@interface TestGoogleMapAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TestGoogleMapViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TestGoogleMapViewController *viewController;

@end

