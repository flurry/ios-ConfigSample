//
//  LoaderViewController+Themes.m
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/22/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import "LoaderViewController.h"
#import "LoaderViewController+Themes.h"
#import "UIColor+ConfigColor.h"
#import "ConfigUtility.h"
#import "UIColor+ConfigColor.h"
#import "Flurry.h"

@implementation LoaderViewController (Themes)

- (void)configNavigationBar
{
    // 68 119 133
    [self.navigationController.navigationBar setBackgroundImage:[ConfigUtility imageGradientColorDefaultForBounds:self.navigationController.navigationBar.bounds]
                                                 forBarPosition:UIBarPositionTopAttached
                                                     barMetrics:UIBarMetricsDefault];
}

- (void)configToolBar
{
    [self.navigationController.toolbar setBackgroundImage:[ConfigUtility imageGradientColorDefaultForBounds:self.navigationController.navigationBar.bounds] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.toolbar setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - self.navigationController.toolbar.frame.size.height, [UIScreen mainScreen].bounds.size.width, self.navigationController.toolbar.frame.size.height)];
    
    
    //[self.navigationController.toolbar setBarStyle:UIBarStyleBlackOpaque];
//    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    [self.navigationController.toolbar setBarStyle:UIBarStyleBlackOpaque];
//    UIBarButtonItem *customItem = [[UIBarButtonItem alloc] initWithTitle:@"LoaderView" style:UIBarButtonItemStylePlain target:nil action:nil];
//    NSArray *toolbarItems = [NSArray arrayWithObjects:spaceItem, customItem, spaceItem, nil];
//    
//    [self setToolbarItems:toolbarItems animated:YES];
}

- (void)configUIElements:(NSString *)theme
{
    if ([theme isEqualToString:@"ChineseNewYear"])
    {
        self.themeName = @"Chinese New Year";
        [self configShowSampleWithTheme:[ConfigUtility imageGradientColorChunjieForBounds:self.fetchButton.bounds] withTextColor:[UIColor whiteColor] withImage:@"LanternIcon" withThemeName:self.themeName];
    } else if ([theme isEqualToString:@"Diwali"])
    {
        self.themeName = @"Diwali";
        [self configShowSampleWithTheme:[ConfigUtility imageGradientColorDiwaliForBounds:self.fetchButton.bounds] withTextColor:[UIColor whiteColor] withImage:@"DiwaliIcon" withThemeName:self.themeName];
    } else if ([theme isEqualToString:@"Christmas"])
    {
        self.themeName = @"Christmas";
        [self configShowSampleWithTheme:[ConfigUtility imageGradientColorXmasForBounds:self.fetchButton.bounds] withTextColor:[UIColor colorFlickrRed] withImage:@"XmasIcon" withThemeName:self.themeName];
    } else if ([theme isEqualToString:@"StPatrick"])
    {
        self.themeName = @"St Patrick's";
        [self configShowSampleWithTheme:[ConfigUtility imageGradientColorStPatrickForBounds:self.fetchButton.bounds] withTextColor:[UIColor whiteColor] withImage:@"StPatrickIcon" withThemeName:self.themeName];
    } else {
        [self unconfig];
        // Don't show Sample
    }
}

- (void)unconfig
{
    [self.nextPageButton setHidden:YES];
    [self.sampleIcon setHidden:YES];
}

- (void)configShowSampleWithTheme:(UIImage *)theme withTextColor:(UIColor *)textColor withImage:(NSString *)imageName withThemeName:(NSString *)themeName
{
    [Flurry logEvent:@"User.SwitchTheme" withParameters:@{@"Theme":themeName}];
    // Button
    [self.nextPageButton setTitleColor:textColor forState:UIControlStateNormal];
    [self.nextPageButton setBackgroundImage:theme forState:UIControlStateNormal];
    [self.nextPageButton setHidden:NO];
    [self.nextPageButton setTitle:self.themeName forState:UIControlStateNormal];
    
    // IconImage
    UIImage *image = [UIImage imageNamed:imageName];
    [self.sampleIcon setImage:image];
    [self.sampleIcon setHidden:NO];
    
    
    [self startTimelyPush];
}

@end
