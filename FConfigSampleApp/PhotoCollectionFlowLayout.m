//
//  PhotoCollectionFlowLayout.m
//  FConfigSampleApp
//
//  Created by Yuning Jin on 6/21/17.
//  Copyright © 2017 Yuning Jin. All rights reserved.
//

#import "PhotoCollectionFlowLayout.h"
#import "PhotoShelfView.h"

@interface PhotoCollectionFlowLayout()

@property (nonatomic, strong) NSDictionary *shelfRects;

@end

@implementation PhotoCollectionFlowLayout

-(instancetype)init
{
    if (!(self = [super init])) return nil;
    
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.itemSize = CGSizeMake(110, 110);
    self.sectionInset = UIEdgeInsetsMake(20, 15, 20, 15);
    self.minimumInteritemSpacing = 5.0f;
    self.minimumLineSpacing = 15.0f;
    
    [self registerClass:[PhotoShelfView class] forDecorationViewOfKind:[PhotoShelfView kind]];
    
    return self;
}

//- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind atIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:decorationViewKind withIndexPath:indexPath];
//    layoutAttributes.frame = CGRectMake(0.0, 0.0, 35, 35);
//    layoutAttributes.zIndex = -1;
//    return layoutAttributes;
//}
//
//- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
//{
//    NSMutableArray *allAttributes = [NSMutableArray new];
//    
//    [allAttributes addObject:[self layoutAttributesForDecorationViewOfKind:[PhotoShelfView kind] atIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]];
////    [allAttributes addObject:[self layoutAttributesForDecorationViewOfKind:[PhotoShelfView kind] atIndexPath:[NSIndexPath indexPathForItem:1 inSection:0]]];
//    
//    for (NSInteger i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++)
//    {
//        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
//        UICollectionViewLayoutAttributes *layoutAttributes = [self layoutAttributesForItemAtIndexPath:indexPath];
//        [allAttributes addObject:layoutAttributes];
//    }
//    return allAttributes;
//}


@end
