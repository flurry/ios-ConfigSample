//
//  FlickrPhotoService.h
//  FConfigSampleApp
//
//  Created by Yuning Jin on 7/6/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConfigUtility.h"

@class FlickrPhoto;

@interface FlickrPhotoService : NSObject

+ (void)fetchPhotosWithText:(NSString *)searchText withTag:(NSString *)searchTag withColorCode:(FlickrColorCodes)colorCode withPhotoNumber:(NSInteger)photoNumber withCompletionHandler:(void (^)(NSArray *photos))completionHandler;

+ (void)fetchPhoto:(FlickrPhoto *)photo withCompletionHandler:(void (^)(NSData *photoData))completionHandler;
@end
