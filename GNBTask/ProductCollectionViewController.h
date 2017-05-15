//
//  ProductCollectionViewController.h
//  GNBTask
//
//  Created by ahmed on 5/15/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "productCollectionViewCell.h"

@interface ProductCollectionViewController : UICollectionViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic ,strong) NSMutableArray *productsArray;

@end
