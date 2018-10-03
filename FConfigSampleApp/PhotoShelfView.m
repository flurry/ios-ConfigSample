//
//  PhotoShelfView.m
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/26/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import "PhotoShelfView.h"

@interface PhotoShelfView()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation PhotoShelfView

static NSString * const kPhotoShelfViewIdentifier = @"ShelfView";
static float rotations = 1;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //[self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"DecorationBar"]]];
        UIImage *image = [UIImage imageNamed:@"FlurryIcon"];
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0 - frame.size.height, 0, frame.size.height, frame.size.height)];
        [self.imageView setImage:image];
        [self runSpinAnimationWithDuration:5];
        [self runMoveAnimationWithDuration:5];
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)runSpinAnimationWithDuration:(CGFloat) duration
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: -M_PI * 2.0 * rotations * duration];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = INFINITY;
    // ease out effect
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)runMoveAnimationWithDuration:(CGFloat) duration
{
    CABasicAnimation* moveAnimation;
    moveAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    moveAnimation.byValue = [NSNumber numberWithFloat:[UIScreen mainScreen].bounds.size.width + self.frame.size.width];
    moveAnimation.duration = duration;
    moveAnimation.cumulative = NO;
    moveAnimation.repeatCount = INFINITY;
    moveAnimation.fillMode = kCAFillModeForwards;
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.layer addAnimation:moveAnimation forKey:@"moveAnimation"];
}

//- (void)layoutSubviews
//{
//    self.layer.shadowOpacity = 0.4;
//    self.layer.shadowOffset = CGSizeMake(0,3);
//    CGRect shadowBounds = CGRectMake(0, -5, self.bounds.size.width, self.bounds.size.height + 5);
//    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:shadowBounds].CGPath;
//}

+ (NSString *)kind
{
    return kPhotoShelfViewIdentifier;
}

@end
