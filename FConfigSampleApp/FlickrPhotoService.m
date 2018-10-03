//
//  FlickrPhotoService.m
//  FConfigSampleApp
//
//  Created by Yuning Jin on 7/6/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import "FlickrPhotoService.h"
#import "FlickrPhoto.h"

static NSString * const baseURL = @"https://api.flickr.com/services/rest/";
static NSString * const searchMethod = @"flickr.photos.search";
static NSString * const getRecentMethod = @"flickr.photos.getRecent";
static NSString * const photosPerPage = @"6";

static NSString * const APIkey = @"2df3c4973c5bd5eb029a7603794f38ae";

static NSString * const photoSize = @"q";
static NSString * const safeSearch = @"1";
@interface FlickrPhotoService()

@end

@implementation FlickrPhotoService

+ (void)fetchPhotosWithText:(NSString *)searchText withTag:(NSString *)searchTag withColorCode:(FlickrColorCodes)colorCode withPhotoNumber:(NSInteger)photoNumber withCompletionHandler:(void (^)(NSArray *photos))completionHandler
{
    
    NSString *URLString = [NSString stringWithFormat:@"%@?method=%@&api_key=%@&format=json&nojsoncallback=1&per_page=%@&safe_search=%@", baseURL, searchMethod, APIkey, [NSString stringWithFormat:@"%ld", photoNumber], safeSearch];
    
    if (searchText != nil && ![searchText isEqualToString:@""])
    {
        URLString = [URLString stringByAppendingString:[NSString stringWithFormat:@"&text=%@", searchText]];
    }
    
    if (searchTag != nil && ![searchTag isEqualToString:@""])
    {
        URLString = [URLString stringByAppendingString:[NSString stringWithFormat:@"&tags=%@", searchTag]];
    }
    
    if (colorCode != FlickrColorNone)
    {
        URLString = [URLString stringByAppendingString:[NSString stringWithFormat:@"&color_codes=%@", [ConfigUtility convertColorCode:colorCode]]];
    }
    
    NSURL *URL = [NSURL URLWithString:[URLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    NSLog(@"Flickr Fetch: %@", URLString);
    
    NSURLSessionDownloadTask *downloadTask = [[NSURLSession sharedSession] downloadTaskWithURL:URL completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if ([(NSHTTPURLResponse *)response statusCode] == 200 &&error == nil)
        {
            NSLog(@"- Photo List Fetch Success -");
            
            NSData *photoListData = [NSData dataWithContentsOfURL:location];
            NSDictionary *photoListRawDictionary = [NSJSONSerialization JSONObjectWithData:photoListData options:0 error:nil];
            NSArray *photoListArray = (NSArray *)photoListRawDictionary[@"photos"][@"photo"];
            NSMutableArray *photoArray = [NSMutableArray new];
            for (NSDictionary* photoItem in photoListArray)
            {
                NSString *farmId = photoItem[@"farm"] ? photoItem[@"farm"] : @"1";
                FlickrPhoto *photo = [[FlickrPhoto alloc] initWithFarmId:farmId withServerId:photoItem[@"server"] withPhotoId:photoItem[@"id"] withSecret:photoItem[@"secret"]];
                if (photo)
                {
                    [photoArray addObject:photo];
                }
            }
            completionHandler([photoArray copy]);
        }
    }];
    
    [downloadTask resume];
}

+ (void)fetchPhoto:(FlickrPhoto *)photo withCompletionHandler:(void (^)(NSData *photoData))completionHandler

{
    NSString *URLString = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@_%@.jpg", photo.farmId, photo.serverId, photo.photoId, photo.secret, photoSize];
    NSURL *URL = [NSURL URLWithString:URLString];
    NSLog(@"Flickr Photo Fetch: %@", URLString);
    NSURLSessionDownloadTask *downloadTask = [[NSURLSession sharedSession] downloadTaskWithURL:URL completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *photoData = [NSData dataWithContentsOfURL:location];
        completionHandler(photoData);
    }];
    
    [downloadTask resume];
}


@end
