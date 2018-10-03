//
//  ConfigUtility.h
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/22/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    FlickrRed = 0,
    FlickrDarkOrange = 1,
    FlickrOrange = 2,
    FlickrPalePink = 3,
    FlickrLemonYellow = 4,
    FlickrSchoolBusYellow = 5,
    FlickrGreen = 6,
    FlickrDarkLimeGreen = 7,
    FlickrCyan = 8,
    FlickrBlue = 9,
    FlickrViolet = 10,
    FlickrPink = 11,
    FlickrWhite = 12,
    FlickrGrey = 13,
    FlickrBlack = 14,
    FlickrColorNone = 15
} FlickrColorCodes;

@interface ConfigUtility : NSObject

+ (UIImage *)imageGradientColorStPatrickForBounds:(CGRect)bounds;
+ (UIImage *)imageGradientColorDiwaliForBounds:(CGRect)bounds;
+ (UIImage *)imageGradientColorChunjieForBounds:(CGRect)bounds;
+ (UIImage *)imageGradientColorXmasForBounds:(CGRect)bounds;
+ (UIImage *)imageGradientColorDefaultForBounds:(CGRect)bounds;

+ (UIImage *)imageGradientColorBlend:(UIColor *)midColor forBounds:(CGRect)bounds;
+ (UIImage *)imageGradientColor:(NSArray *)arrayGradientColor forBounds:(CGRect)bounds;

// Color Gradient Array
+ (NSArray *)arrayGradientColorBarWithFirst:(UIColor *)color1 withSecond:(UIColor *)color2 withThird:(UIColor *)color3;

// Flickr Color Codes
+ (UIColor *) convertFlickrColor:(FlickrColorCodes)colorCode;
+ (NSString *) convertColorCode:(FlickrColorCodes)colorCode;
@end
