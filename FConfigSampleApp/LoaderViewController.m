//
//  LoaderViewController.m
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/21/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import "LoaderViewController.h"
#import "PhotoViewController.h"
#import "PhotoCollectionFlowLayout.h"
#import "UIColor+ConfigColor.h"
#import "LoaderViewController+Themes.h"
#import "ConfigUtility.h"
#import "FConfig.h"
#import <sys/utsname.h>

#define degreesToRadians(x) (M_PI * x / 180.0)

@interface LoaderViewController ()
{
    int countDown;
}

@property (nonatomic, strong) NSString *welcomeLabelText;
@property (nonatomic, strong) NSString *theme;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UILabel *metaDataLabel;
@end

@implementation LoaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    countDown = 3;
    
    [self configNavigationBar];
    [self configToolBar];
    
    [self loadUIElements];
    
    
    //Step 2
    [[FConfig sharedInstance] registerObserver:self withExecutionQueue:dispatch_queue_create("dispatch_queue_#1", 0)];
    
    [self activateConfig];
}

- (void)activateConfig
{
    // Find them in LoaderViewController+Themes.h
    dispatch_async(dispatch_get_main_queue(), ^{
        // Fetch Configs //
        self.welcomeLabelText = [[FConfig sharedInstance] getStringForKey:@"WelcomeMessage" withDefault:@"Setup Config and Fetch Config"];
        self.theme = [[FConfig sharedInstance] getStringForKey:@"Theme" withDefault:@"None"];
        //              //
        
        [self configNavigationBar];
        [self configToolBar];
        [self configUIElements:self.theme];
        
        // Simple Example
        [self configLabelText];
        
        // zigzag Example
        NSString *zigzag = [[FConfig sharedInstance] getStringForKey:@"Zigzag" withDefault:@"No"];
        if ([[zigzag lowercaseString] isEqualToString:@"yes"])
        {
            NSLog(@"NOCNOC, zigzag activated");
            [self zigzagButton];
        } else {
            [self unzigzagButton];
        }
    });
}

- (void)zigzagButton
{
    self.fetchButton.transform = CGAffineTransformRotate(CGAffineTransformIdentity, degreesToRadians(-15));
    self.nextPageButton.transform = CGAffineTransformRotate(CGAffineTransformIdentity, degreesToRadians(15));
}

- (void)unzigzagButton
{
    self.fetchButton.transform = CGAffineTransformIdentity;
    self.nextPageButton.transform = CGAffineTransformIdentity;
}

- (void)viewWillAppear:(BOOL)animated
{
}

- (void)loadUIElements
{
    [self addMetaData];
    [self addFetchStatusLabel];
    [self addFetchButton];
    [self addNextButton];
    [self addSampleIcon];
    
    [self addConstraints];
}

- (void) configLabelText
{
    self.fetchStatusLabel.text = self.welcomeLabelText;
    self.fetchStatusLabel.textColor = [UIColor colorNavGradientMiddleBlue];
}

#pragma mark - Config Delegate

//Step 5
- (void) fetchComplete
{
    //Step 4
    [[FConfig sharedInstance] activateConfig];
    [self activateConfig];
}

- (void) fetchCompleteNoChange
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.fetchStatusLabel.text = @"Fetched config but there is no change";
        self.fetchStatusLabel.textColor = [UIColor colorFlickrOrange];
    });
}
- (void) fetchFail
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.fetchStatusLabel.text = @"Fetched Failed!";
        self.fetchStatusLabel.textColor = [UIColor colorFlickrRed];
    });
}
//- (void) activationComplete;

#pragma mark - UI Components

- (void)addSampleIcon
{
    UIImage *image = [UIImage imageNamed:@"FlurryIcon"];
    self.sampleIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 50, 50)];
    [self.sampleIcon setImage:image];
    self.sampleIcon.translatesAutoresizingMaskIntoConstraints = NO;
    [self.sampleIcon setHidden:YES];
    [self.view addSubview:self.sampleIcon];
}

- (void)addFetchStatusLabel
{
    self.fetchStatusLabel = [[UILabel alloc]
                  initWithFrame:CGRectMake(50.0f, 150.0f, 250.0f, 30.0f)];
    self.fetchStatusLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.fetchStatusLabel.text = @"Setup Config and Fetch Config";
    self.fetchStatusLabel.textAlignment = NSTextAlignmentCenter;
    self.fetchStatusLabel.textColor = [UIColor colorNavGradientMiddleBlue];
    [self.view addSubview:self.fetchStatusLabel];
}

- (void)addMetaData
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *versionNum = [bundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSString *buildNum = [bundle objectForInfoDictionaryKey:@"CFBundleVersion"];
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModelRaw = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    
    self.metaDataLabel = [[UILabel alloc]
                             initWithFrame:CGRectMake(50.0f, 150.0f, 250.0f, 30.0f)];
    self.metaDataLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.metaDataLabel.text =[NSString stringWithFormat:@"Ver: %@; Build: %@; Device: %@", versionNum, buildNum, deviceModelRaw];
    self.metaDataLabel.textAlignment = NSTextAlignmentCenter;
    self.metaDataLabel.textColor = [UIColor colorNavGradientMiddleBlue];
    [self.view addSubview:self.metaDataLabel];
}

- (void)addFetchButton
{
    self.fetchButton =
    [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.fetchButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.fetchButton.frame = CGRectMake(160.0f, 200.0f, 120.0f, 30.0f);
    
    [self.fetchButton setTitle:@"Fetch Config" forState:UIControlStateNormal];
    [self.fetchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.fetchButton setBackgroundImage:[ConfigUtility imageGradientColorDefaultForBounds:self.fetchButton.bounds] forState:UIControlStateNormal];
    
    [self.fetchButton addTarget:self
               action:@selector(fetchButtonPressed)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.fetchButton];
}


- (void)addNextButton
{
    self.nextPageButton =
    [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.nextPageButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.nextPageButton.frame = CGRectMake(160.0f, 400.0f, 170.0f, 30.0f);
    [self.nextPageButton setTitle:@"Show Config Sample" forState:UIControlStateNormal];
    [self.nextPageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.nextPageButton setBackgroundImage:[ConfigUtility imageGradientColorDefaultForBounds:self.fetchButton.bounds] forState:UIControlStateNormal];
    
    [self.nextPageButton addTarget:self
                    action:@selector(timerReset)
          forControlEvents:UIControlEventTouchUpInside];
    [self.nextPageButton setHidden:YES];
    [self.view addSubview:self.nextPageButton];
}

- (void)fetchButtonPressed {
    NSLog(@"FETCH BUTTON PRESSED");
    
    //Step 3
    [[FConfig sharedInstance] fetchConfig];
}


- (void)nextButtonPressed {
    NSLog(@"NEXT BUTTON PRESSED");
    
    PhotoViewController *configViewController = [[PhotoViewController alloc] initWithCollectionViewLayout:[[PhotoCollectionFlowLayout alloc] init]];
    configViewController.theme = self.theme;
    [self.navigationController pushViewController:configViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Countdown Push

- (void)startTimelyPush
{
    if (self.timer != nil)
    {
        [self.timer invalidate];
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

- (void)timerFired
{
    if (countDown <= 0)
    {
        [self timerReset];
        return;
    }
    [self.nextPageButton setTitle:[NSString stringWithFormat:@"%d", countDown] forState:UIControlStateNormal];
    countDown--;
}

- (void)timerReset
{
    [self.timer invalidate];
    countDown = 3;
    [self.nextPageButton setTitle:self.themeName forState:UIControlStateNormal];
    [self nextButtonPressed];
}

#pragma mark - Add UI Constraints

- (void)addConstraints
{
    // Center
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.fetchButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.nextPageButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.sampleIcon attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.fetchStatusLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.metaDataLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
    
    // Edge-to-edge
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.fetchStatusLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.f constant:100.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.fetchButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.f constant:-50.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.nextPageButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.f constant:-200.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.metaDataLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.f constant:-45.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.sampleIcon attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.nextPageButton attribute:NSLayoutAttributeBottom multiplier:1.f constant:1.f]];
    
    // Width/Height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.fetchButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:120.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.fetchButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:30.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.fetchStatusLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:300.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.fetchStatusLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:30.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.metaDataLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:300.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.metaDataLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:30.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.nextPageButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:170.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.nextPageButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:30.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.sampleIcon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:107.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.sampleIcon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:110.f]];
    
}
@end
