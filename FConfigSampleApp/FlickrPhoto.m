//
//  FlickrPhoto.m
//  FConfigSampleApp
//
//  Created by Yuning Jin on 7/6/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import "FlickrPhoto.h"

@implementation FlickrPhoto

- (instancetype)init
{
    NSAssert(NO, @"init should not be called");
    return nil;
}

- (instancetype)initWithFarmId:(NSString *)farmId withServerId:(NSString *)serverId withPhotoId:(NSString *)photoId withSecret:(NSString *)secret
{
    self = [super init];
    if (self)
    {
        self.farmId = farmId;
        self.serverId = serverId;
        self.photoId = photoId;
        self.secret = secret;
    }
    
    return self;
}

@end
