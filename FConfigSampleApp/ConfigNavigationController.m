//
//  ConfigNavigationController.m
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/21/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import "ConfigNavigationController.h"
#import "UIColor+ConfigColor.h"
#import "LoaderViewController.h"

@interface ConfigNavigationController ()

@end

@implementation ConfigNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNavigationBar];
    [self configToolBar];
    
    // load first view controller
    LoaderViewController *loaderViewController = [[LoaderViewController alloc] init];
    [self pushViewController:loaderViewController animated:YES];
}

- (void)configToolBar
{
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self setToolbarHidden:NO animated:NO];
}

- (void)configNavigationBar
{
    // See view controllers implementation on its stack
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
