//
//  ProductCollectionViewController.m
//  GNBTask
//
//  Created by ahmed on 5/15/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import "ProductCollectionViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "Product.h"
#import "ImageDetails.h"

@interface ProductCollectionViewController ()<UICollectionViewDelegateFlowLayout>

@end

@implementation ProductCollectionViewController

static NSString * const reuseIdentifier = @"productCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadProducts:0];
    
    [self.collectionView setPagingEnabled:YES];
    
    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    [collectionViewFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView.collectionViewLayout = collectionViewFlowLayout;
    
    
}

-(void)loadProducts:(int)page {
    int pageSize=20;
    page=page*pageSize;
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat: @"http://grapesnberries.getsandbox.com/products?count=%d&from=%d",pageSize,page]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        if(!self.productsArray)
            self.productsArray=[NSMutableArray new];
        [self.productsArray addObjectsFromArray:[Product deserializeProductFromJSON:responseObject]];
        [self.collectionView reloadData];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1 ;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.productsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    productCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    [cell setEntity:[self.productsArray objectAtIndex:indexPath.row]];
    
    
    return cell;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    for (UICollectionViewCell *cell in [self.collectionView visibleCells]) {
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
        NSUInteger lastIndex = [indexPath indexAtPosition:[indexPath length] - 1];
        NSLog(@"Last Index: %lu",(unsigned long)lastIndex);
        [self loadProducts:(int)self.productsArray.count/20];
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView

                   layout:(UICollectionViewLayout *)collectionViewLayout

minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0;
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView

                  layout:(UICollectionViewLayout *)collectionViewLayout

  sizeForItemAtIndexPath:(NSIndexPath *)indexPath

{
    Product *p = self.productsArray[indexPath.row];
    ImageDetails *im = (ImageDetails *)p.productImageDetails;
    CGFloat width=CGRectGetWidth(collectionView.frame)/2.0f-10;
    CGFloat height=im.imageHeight.doubleValue*(width/im.imageWidth.doubleValue);
    return CGSizeMake(width,height);
    
    
}



#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
