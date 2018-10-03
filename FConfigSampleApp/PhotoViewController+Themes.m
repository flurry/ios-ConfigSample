//
//  PhotoViewController+Themes.m
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/22/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import "PhotoViewController+Themes.h"
#import "FlickrPhotoService.h"
#import "UIColor+ConfigColor.h"

@implementation PhotoViewController (Themes)

- (void)configWithTheme:(NSString *)theme
{
    if ([theme isEqualToString:@"ChineseNewYear"])
    {
        self.themeColorGradient = [ConfigUtility imageGradientColorChunjieForBounds:self.navigationController.navigationBar.bounds];
        [self configFetchFlickrPhotoWithSearchTag:@"Chinese New Year" withColorCode:FlickrRed];
    } else if ([theme isEqualToString:@"Diwali"])
    {
        self.themeColorGradient = [ConfigUtility imageGradientColorDiwaliForBounds:self.navigationController.navigationBar.bounds];
        [self configFetchFlickrPhotoWithSearchTag:@"Diwali" withColorCode:FlickrDarkOrange];
    } else if ([theme isEqualToString:@"Christmas"])
    {
        self.themeColorGradient = [ConfigUtility imageGradientColorXmasForBounds:self.navigationController.navigationBar.bounds];
        [self configFetchFlickrPhotoWithSearchTag:@"Christmas" withColorCode:FlickrRed];
    } else if ([theme isEqualToString:@"StPatrick"])
    {
        self.themeColorGradient = [ConfigUtility imageGradientColorStPatrickForBounds:self.navigationController.navigationBar.bounds];
        [self configFetchFlickrPhotoWithSearchTag:@"St Patrick's" withColorCode:FlickrGreen];
    } else {
        //  Default Theme, No photo
        self.themeColorGradient = [ConfigUtility imageGradientColorDefaultForBounds:self.navigationController.navigationBar.bounds];
    }
    
//    dispatch_async(dispatch_get_main_queue(), ^{
        [self configNavigationBar];
        [self configToolBar];
        [self configCollectionView];
//    });
}

- (void)configNavigationBar
{
    
    [self.navigationController.navigationBar setBackgroundImage:self.themeColorGradient
                                                 forBarPosition:UIBarPositionTopAttached
                                                     barMetrics:UIBarMetricsDefault];
}

- (void)configToolBar
{
    [self.navigationController.toolbar setBackgroundImage:self.themeColorGradient forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    [self.navigationController.toolbar setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - self.navigationController.toolbar.frame.size.height, [UIScreen mainScreen].bounds.size.width, self.navigationController.toolbar.frame.size.height)];
    
//    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    UIBarButtonItem *customItem = [[UIBarButtonItem alloc] initWithTitle:@"Photos" style:UIBarButtonItemStylePlain    target:nil     action:nil];
//    NSArray *toolbarItems = [NSArray arrayWithObjects:spaceItem, customItem, spaceItem, nil];
//    
//    [self setToolbarItems:toolbarItems animated:YES];
}

- (void)configCollectionView
{
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
}

- (void)configFetchFlickrPhotoWithSearchTag:(NSString *)tag withColorCode:(FlickrColorCodes)color
{
    self.photoNumber = 99;
    self.searchText = @"";
    self.searchTag = tag;
    self.colorCode = color;
    
    [FlickrPhotoService fetchPhotosWithText:self.searchText withTag:self.searchTag withColorCode:self.colorCode withPhotoNumber:self.photoNumber withCompletionHandler:^(NSArray *photos) {
        NSLog(@"Completed Loading PhotosURLs");
        self.photos = photos;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
        
    }];
}

@end
