//
//  PhotoCollectionViewCell.h
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/21/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlickrPhoto;

@interface PhotoCollectionViewCell : UICollectionViewCell

- (void)configPhotoCell:(FlickrPhoto *)photo;
+ (NSString *)identifier;

@end
