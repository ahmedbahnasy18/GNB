//
//  Product.h
//  GNBTask
//
//  Created by ahmed on 5/15/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface Product : MTLModel <MTLJSONSerializing>

@property (nonatomic ,copy ,readonly) NSNumber *productID;
@property (nonatomic ,copy) NSString *productDescription;
@property (nonatomic) NSDictionary *productImageDetails;
@property (nonatomic ,copy) NSNumber *productPrice;

+ (NSArray *)deserializeProductFromJSON:(NSArray *)productJSON;

@end
