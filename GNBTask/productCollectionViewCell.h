//
//  productCollectionViewCell.h
//  GNBTask
//
//  Created by ahmed on 5/15/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface productCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *productPrice_lbl;
@property (strong, nonatomic) IBOutlet UIImageView *productImage_img;
@property (strong, nonatomic) IBOutlet UILabel *productDescription_lbl;
@property (nonatomic ,strong) Product *entity;

@end
