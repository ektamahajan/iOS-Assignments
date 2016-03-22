//
//  AppDelegate.m
//  Country_Location
//
//  Ekta Mahajan [SUID- 29317-4940]
//  Course CIS-651
//  Homework:4
//  Source:- Prof Irwin  Modified - Ekta Mahajan
//  Copyright © 2015 Ekta Mahajan. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"


@interface AppDelegate ()
@property CLLocationManager *mgr;
@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ( [CLLocationManager locationServicesEnabled] )
    {
        self.mgr = [[CLLocationManager alloc] init];  // get a location manager
        self.mgr.distanceFilter = 5.0;                // set criterion for location updating
        self.mgr.desiredAccuracy = kCLLocationAccuracyBest; // set criterion for location updating
        self.mgr.delegate = (ViewController *) self.window.rootViewController; // establish delegate to listen for updates
        if ( [[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.0 )
        {
            [self.mgr requestAlwaysAuthorization]; // for permission to use location services whenever the app is running.
             [self.mgr requestWhenInUseAuthorization]; // for permission to use most location services while the app is in the foreground.
        }
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    // tell location manager to stop listening for location updates
    [self.mgr stopUpdatingLocation];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    // tell location manager to start listening for location updates
    [self.mgr startUpdatingLocation];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
