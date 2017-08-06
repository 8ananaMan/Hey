//
//  WaterFlowLayout.h
//  WterFlow
//
//  Created by mac on 17/3/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WaterFlowLayout;

@protocol WaterFlowLayoutDelegate <NSObject>

@required
- (CGFloat)waterFlowLayout:(WaterFlowLayout *)layout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;


@optional
- (NSInteger)waterFlowLayoutColumnCount:(WaterFlowLayout *)layout;
- (CGFloat)waterFlowLayoutColumnSpacing:(WaterFlowLayout *)layout;
- (CGFloat)waterFlowLayoutRowSpacing:(WaterFlowLayout *)layout;
- (UIEdgeInsets)waterFlowLayoutEdgeInsets:(WaterFlowLayout *)layout;

@end

@interface WaterFlowLayout : UICollectionViewLayout

@property (nonatomic,weak) id<WaterFlowLayoutDelegate> delegate;


@end
