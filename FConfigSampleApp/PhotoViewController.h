//
//  PhotoViewController.h
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/21/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigUtility.h"

@interface PhotoViewController : UICollectionViewController

// Config Theme
@property (nonatomic, strong) NSString *theme;

@property (nonatomic, copy) NSArray * photos;
@property (nonatomic, strong) UIImage *themeColorGradient;
@property (nonatomic, strong) NSString * searchText;
@property (nonatomic, strong) NSString * searchTag;
@property (nonatomic, assign) NSInteger photoNumber;
@property (nonatomic, assign) FlickrColorCodes colorCode;

@end
