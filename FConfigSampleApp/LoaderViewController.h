//
//  LoaderViewController.h
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/21/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoaderViewController : UIViewController

@property (nonatomic, strong) UILabel *fetchStatusLabel;
@property (nonatomic, strong) UIButton *fetchButton;
@property (nonatomic, strong) UIButton *nextPageButton;
@property (nonatomic, strong) UIImageView *sampleIcon;
@property (nonatomic, strong) NSString *themeName;

- (void)startTimelyPush;

@end

