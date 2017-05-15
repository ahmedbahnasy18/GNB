//
//  productCollectionViewCell.m
//  GNBTask
//
//  Created by ahmed on 5/15/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import "productCollectionViewCell.h"
#import "ImageDetails.h"
#import "UIImageView+AFNetworking.h"
#import "AFNetworking.h"

@implementation productCollectionViewCell
-(void)setEntity:(Product*)entity{
    self.productPrice_lbl.text = [NSString localizedStringWithFormat:@"$ %ld",(long)entity.productPrice];
    self.productDescription_lbl.text = entity.productDescription;
    [self.productDescription_lbl sizeToFit];
    ImageDetails *img = (ImageDetails *)entity.productImageDetails;
    [self.productImage_img setImageWithURL:[NSURL URLWithString:img.imageURL]];
}
@end
