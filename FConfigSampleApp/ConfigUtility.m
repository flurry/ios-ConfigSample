//
//  ConfigUtility.m
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/22/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import "ConfigUtility.h"
#import "UIColor+ConfigColor.h"

@implementation ConfigUtility

#pragma mark - UIImage from gradient color
+ (UIImage *)imageGradientColor:(NSArray *)arrayGradientColor forBounds:(CGRect)bounds
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    CGRect frame = bounds;
    frame.size.height += 100;
    gradient.frame = frame;
    gradient.startPoint = CGPointMake(0.0, 0.5);
    gradient.endPoint = CGPointMake(1.0, 0.5);
    gradient.colors = arrayGradientColor;
    UIGraphicsBeginImageContext(gradient.bounds.size);
    [gradient renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return gradientImage;
}

+ (UIImage *)imageGradientColorBlend:(UIColor *)midColor forBounds:(CGRect)bounds
{
    return [ConfigUtility imageGradientColor:[ConfigUtility arrayGradientColorBarWithFirst:[UIColor colorBlendDarker:midColor] withSecond:midColor withThird:[UIColor colorBlendLighter:midColor]] forBounds:bounds];
}

#pragma mark - Themes
+ (UIImage *)imageGradientColorStPatrickForBounds:(CGRect)bounds
{
    return [ConfigUtility imageGradientColor:[ConfigUtility arrayGradientColorBarWithFirst:[UIColor colorNavGradientStPatrick1] withSecond:[UIColor colorNavGradientStPatrick2] withThird:[UIColor colorNavGradientStPatrick3]] forBounds:bounds];
}

+ (UIImage *)imageGradientColorDiwaliForBounds:(CGRect)bounds
{
    return [ConfigUtility imageGradientColor:[ConfigUtility arrayGradientColorBarWithFirst:[UIColor colorNavGradientDiwali1] withSecond:[UIColor colorNavGradientDiwali2] withThird:[UIColor colorNavGradientDiwali3]] forBounds:bounds];
}

+ (UIImage *)imageGradientColorChunjieForBounds:(CGRect)bounds
{
    return [ConfigUtility imageGradientColor:[ConfigUtility arrayGradientColorBarWithFirst:[UIColor colorNavGradientChunjie1] withSecond:[UIColor colorNavGradientChunjie2] withThird:[UIColor colorNavGradientChunjie3]] forBounds:bounds];
}

+ (UIImage *)imageGradientColorXmasForBounds:(CGRect)bounds
{
    return [ConfigUtility imageGradientColor:[ConfigUtility arrayGradientColorBarWithFirst:[UIColor colorNavGradientXmas1] withSecond:[UIColor colorNavGradientXmas2] withThird:[UIColor colorNavGradientXmas3]] forBounds:bounds];
}

+ (UIImage *)imageGradientColorDefaultForBounds:(CGRect)bounds
{
    return [ConfigUtility imageGradientColor:[ConfigUtility arrayGradientColorBarWithFirst:[UIColor colorNavGradientPurple] withSecond:[UIColor colorNavGradientMiddleBlue] withThird:[UIColor colorNavGradientLightBlue]] forBounds:bounds];
}

#pragma mark - Color Gradient Array
+ (NSArray *)arrayGradientColorBarWithFirst:(UIColor *)color1 withSecond:(UIColor *)color2 withThird:(UIColor *)color3
{
    return [NSArray
            arrayWithObjects:(id)[color1 CGColor],
            (id)[color2 CGColor],
            (id)[color3 CGColor], nil];
}

#pragma mark - Flickr Utility

+ (UIColor *) convertFlickrColor:(FlickrColorCodes)colorCode
{
    switch (colorCode) {
        case FlickrRed:
            return [UIColor colorFlickrRed];
        case FlickrDarkOrange:
            return [UIColor colorFlickrDarkOrange];
        case FlickrOrange:
            return [UIColor colorFlickrOrange];
        case FlickrPalePink:
            return [UIColor colorFlickrPalePink];
        case FlickrLemonYellow:
            return [UIColor colorFlickrLemonYellow];
        case FlickrSchoolBusYellow:
            return [UIColor colorFlickrSchoolBusYellow];
        case FlickrGreen:
            return [UIColor colorFlickrGreen];
        case FlickrDarkLimeGreen:
            return [UIColor colorFlickrDarkLimeGreen];
        case FlickrCyan:
            return [UIColor colorFlickrCyan];
        case FlickrBlue:
            return [UIColor colorFlickrBlue];
        case FlickrViolet:
            return [UIColor colorFlickrViolet];
        case FlickrPink:
            return [UIColor colorFlickrPink];
        case FlickrWhite:
            return [UIColor colorFlickrWhite];
        case FlickrGrey:
            return [UIColor colorFlickrGrey];
        case FlickrBlack:
            return [UIColor colorFlickrBlack];
        default:
            NSAssert(NO, @"Color code isn't supported by Flickr!");
            return [UIColor brownColor];
    }
}

+ (NSString *) convertColorCode:(FlickrColorCodes)colorCode
{
    switch (colorCode) {
        case FlickrRed:
            return @"0";
        case FlickrDarkOrange:
            return @"1";
        case FlickrOrange:
            return @"2";
        case FlickrPalePink:
            return @"b";
        case FlickrLemonYellow:
            return @"4";
        case FlickrSchoolBusYellow:
            return @"3";
        case FlickrGreen:
            return @"5";
        case FlickrDarkLimeGreen:
            return @"6";
        case FlickrCyan:
            return @"7";
        case FlickrBlue:
            return @"8";
        case FlickrViolet:
            return @"9";
        case FlickrPink:
            return @"a";
        case FlickrWhite:
            return @"c";
        case FlickrGrey:
            return @"d";
        case FlickrBlack:
            return @"e";
        case FlickrColorNone:
            return @"";
        default:
            NSAssert(NO, @"Color code isn't supported by Flickr!");
            return @"-1";
    }
}



@end
