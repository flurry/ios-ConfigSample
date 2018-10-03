//
//  PhotoViewController+Themes.h
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/22/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import "PhotoViewController.h"
#import "ConfigUtility.h"

@interface PhotoViewController (Themes)

- (void)configWithTheme:(NSString *)theme;

- (void)configNavigationBar;
- (void)configToolBar;
- (void)configCollectionView;

@end
