//
//  PhotoCollectionViewCell.m
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/21/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "FlickrPhotoService.h"
#import "FlickrPhoto.h"

@interface PhotoCollectionViewCell()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation PhotoCollectionViewCell

static NSString * const kPhotoCollectionViewCellIdentifier = @"Cell";

- (void)configPhotoCell:(FlickrPhoto *)photo
{
    [self.contentView setBackgroundColor:[UIColor colorWithWhite:0.f alpha:0.f]];
    [self.contentView setOpaque:NO];
    [self addImageViewWithPhoto:photo];
}

- (void)addImageViewWithPhoto:(FlickrPhoto *)photo
{
    
    if (photo == nil) return;
    
    __weak __typeof__(self) welf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        [FlickrPhotoService fetchPhoto:photo withCompletionHandler:^(NSData *photoData) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *image = [UIImage imageWithData:photoData];
                welf.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, welf.contentView.frame.size.width, welf.contentView.frame.size.height)];
                [welf.imageView setImage:image];
                welf.imageView.layer.cornerRadius = roundf(welf.imageView.frame.size.width/10.0f);
                welf.imageView.layer.masksToBounds = YES;
                [welf.contentView addSubview:welf.imageView];
            });
        }];
    });
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    if (newSuperview)
    {
        self.layer.shadowOpacity = 0.5;
        self.layer.shadowOffset = CGSizeMake(0, 3);
        self.layer.shadowPath = [[UIBezierPath bezierPathWithRect:CGRectInset(self.imageView.bounds,2,2)] CGPath];
    }
}

+ (NSString *)identifier
{
    return kPhotoCollectionViewCellIdentifier;
}

@end
