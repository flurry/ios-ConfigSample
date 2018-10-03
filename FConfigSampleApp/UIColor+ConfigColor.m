//
//  UIColor+ConfigColor.m
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/21/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import "UIColor+ConfigColor.h"

@implementation UIColor (ConfigColor)


static CGFloat moderateVar = 20. / 255.f;
static CGFloat seriousVar = 40. / 255.f;
static CGFloat mainVar = 5. / 255.f;

+ (UIColor *)colorBlendLighter:(UIColor *)rawColor
{
    CGFloat r, g, b, a;
    if ([rawColor getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MIN(r + moderateVar, 1.0)
                               green:MIN(g + seriousVar, 1.0)
                                blue:MIN(b + mainVar, 1.0)
                               alpha:a];
    return nil;
}

+ (UIColor *)colorBlendDarker:(UIColor *)rawColor
{
    CGFloat r, g, b, a;
    if ([rawColor getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MAX(r - moderateVar, 0.0)
                               green:MAX(g - seriousVar, 0.0)
                                blue:MAX(b - mainVar, 0.0)
                               alpha:a];
    return nil;
}

+ (UIColor *)colorNavGradientLightBlue {
    return [UIColor colorWithRed:25 / 255.f
                           green:143 / 255.f
                            blue:189 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorNavGradientMiddleBlue {
    return [UIColor colorWithRed:24 / 255.f
                           green:76 / 255.f
                            blue:179 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorNavGradientPurple {
    return [UIColor colorWithRed:32 / 255.f
                           green:6 / 255.f
                            blue:153 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorNavGradientXmas1 {
    return [UIColor colorWithRed:146 / 255.f
                           green:180 / 255.f
                            blue:245 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorNavGradientXmas2 {
    return [UIColor colorWithRed:182 / 255.f
                           green:201 / 255.f
                            blue:246 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorNavGradientXmas3 {
    return [UIColor colorWithRed:219 / 255.f
                           green:223 / 255.f
                            blue:250 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorNavGradientDiwali1 {
    return [UIColor colorWithRed:181 / 255.f
                           green:95 / 255.f
                            blue:28 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorNavGradientDiwali2 {
    return [UIColor colorWithRed:201 / 255.f
                           green:135 / 255.f
                            blue:5 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorNavGradientDiwali3 {
    return [UIColor colorWithRed:221 / 255.f
                           green:175 / 255.f
                            blue:10 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorNavGradientChunjie1 {
    return [UIColor colorWithRed:216 / 255.f
                           green:26 / 255.f
                            blue:28 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorNavGradientChunjie2 {
    return [UIColor colorWithRed:221 / 255.f
                           green:66 / 255.f
                            blue:48 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorNavGradientChunjie3 {
    return [UIColor colorWithRed:226 / 255.f
                           green:106 / 255.f
                            blue:68 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorNavGradientStPatrick1 {
    return [UIColor colorWithRed:68 / 255.f
                           green:161 / 255.f
                            blue:22 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorNavGradientStPatrick2 {
    return [UIColor colorWithRed:108 / 255.f
                           green:166 / 255.f
                            blue:27 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorNavGradientStPatrick3 {
    return [UIColor colorWithRed:148 / 255.f
                           green:171 / 255.f
                            blue:32 / 255.f
                           alpha:1.0];
}

#pragma mark - Flickr Colors
+ (UIColor *)colorFlickrRed {
    return [UIColor colorWithRed:255 / 255.f
                           green:26 / 255.f
                            blue:0 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorFlickrDarkOrange {
    return [UIColor colorWithRed:163 / 255.f
                           green:70 / 255.f
                            blue:5 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorFlickrOrange {
    return [UIColor colorWithRed:255 / 255.f
                           green:124 / 255.f
                            blue:0 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorFlickrPalePink {
    return [UIColor colorWithRed:255 / 255.f
                           green:158 / 255.f
                            blue:154 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorFlickrLemonYellow {
    return [UIColor colorWithRed:255 / 255.f
                           green:252 / 255.f
                            blue:0 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorFlickrSchoolBusYellow {
    return [UIColor colorWithRed:255 / 255.f
                           green:208 / 255.f
                            blue:0 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorFlickrGreen {
    return [UIColor colorWithRed:142 / 255.f
                           green:228 / 255.f
                            blue:0 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorFlickrDarkLimeGreen {
    return [UIColor colorWithRed:0 / 255.f
                           green:173 / 255.f
                            blue:0 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorFlickrCyan {
    return [UIColor colorWithRed:0 / 255.f
                           green:178 / 255.f
                            blue:214 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorFlickrBlue {
    return [UIColor colorWithRed:0 / 255.f
                           green:95 / 255.f
                            blue:201 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorFlickrViolet {
    return [UIColor colorWithRed:141 / 255.f
                           green:16 / 255.f
                            blue:189 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorFlickrPink {
    return [UIColor colorWithRed:247 / 255.f
                           green:22 / 255.f
                            blue:148 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorFlickrWhite {
    return [UIColor whiteColor];
}

+ (UIColor *)colorFlickrGrey {
    return [UIColor colorWithRed:124 / 255.f
                           green:124 / 255.f
                            blue:124 / 255.f
                           alpha:1.0];
}

+ (UIColor *)colorFlickrBlack {
    return [UIColor blackColor];
}

@end
