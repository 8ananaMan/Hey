//
//  ViewController.m
//  WterFlow
//
//  Created by mac on 17/3/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController.h"
#import "WaterFlowLayout.h"
@interface ViewController ()<UICollectionViewDataSource,WaterFlowLayoutDelegate>

@end

@implementation ViewController

static NSString * const CellIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    WaterFlowLayout * flowLayout = [[WaterFlowLayout alloc] init];
    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [collectionView setDataSource:self];
    [flowLayout setDelegate:self];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    [self.view addSubview:collectionView];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection view data source -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell setBackgroundColor:[UIColor orangeColor]];
    
    NSInteger tag = 10;
    
    UILabel * label = [cell.contentView viewWithTag:tag];
    
    if (!label) {
        label = [[UILabel alloc] init];
        [label setTag:tag];
        [cell.contentView addSubview:label];
    }

    
    [label setText:[NSString stringWithFormat:@"%zd",indexPath.item]];
    [label sizeToFit];
    
    
    return cell;
    
}


#pragma mark - water flow layout delegate -



- (CGFloat)waterFlowLayout:(WaterFlowLayout *)layout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    return 100 + arc4random_uniform(150);
}

- (NSInteger)waterFlowLayoutColumnCount:(WaterFlowLayout *)layout
{
    return 4;
}

- (CGFloat)waterFlowLayoutRowSpacing:(WaterFlowLayout *)layout
{
    return 15;
}

- (CGFloat)waterFlowLayoutColumnSpacing:(WaterFlowLayout *)layout
{
    return 5;
}

//- (UIEdgeInsets)waterFlowLayoutEdgeInsets:(WaterFlowLayout *)layout
//{
//    return UIEdgeInsetsMake(5, 5, 5, 5);
//}

@end
