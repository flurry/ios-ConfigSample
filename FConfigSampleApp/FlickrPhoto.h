//
//  FlickrPhoto.h
//  FConfigSampleApp
//
//  Created by Yuning Jin on 7/6/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrPhoto : NSObject

@property (nonatomic, strong) NSString *farmId;
@property (nonatomic, strong) NSString *serverId;
@property (nonatomic, strong) NSString *photoId;
@property (nonatomic, strong) NSString *secret;

- (instancetype)initWithFarmId:(NSString *)farmId withServerId:(NSString *)serverId withPhotoId:(NSString *)photoId withSecret:(NSString *)secret;

@end
