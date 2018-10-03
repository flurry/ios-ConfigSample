//
//  AppDelegate.m
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/21/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import "AppDelegate.h"
#import "ConfigNavigationController.h"
#import "Flurry.h"
#import "FConfig.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    // Init Loader View
    ConfigNavigationController *configNavigationController = [[ConfigNavigationController alloc] init];
    self.window.rootViewController = configNavigationController;
    
    [self.window makeKeyAndVisible];
    
    
    //Step 1
    [Flurry startSession:@"D8ZPBQ5TC23J57D9WK95"];
    return YES;
}

@end
