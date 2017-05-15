//
//  productCollectionViewCell.m
//  GNBTask
//
//  Created by ahmed on 5/15/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import "productCollectionViewCell.h"
#import "ImageDetails.h"
#import <SDWebImage/UIImageView+WebCache.h>


@implementation productCollectionViewCell
-(void)setEntity:(Product*)entity{
    self.productPrice_lbl.text = [NSString localizedStringWithFormat:@"$ %ld",entity.productPrice.integerValue];
    self.productDescription_lbl.text = entity.productDescription;
    [self.productDescription_lbl sizeToFit];
    ImageDetails *img = (ImageDetails *)entity.productImageDetails;
     [self.productImage_img sd_setImageWithURL:[NSURL URLWithString:img.imageURL]
                  placeholderImage:[UIImage imageNamed:@"1.png"]
                           options:SDWebImageRetryFailed];
    
}
@end
