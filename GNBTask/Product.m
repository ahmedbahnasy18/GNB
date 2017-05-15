//
//  Product.m
//  GNBTask
//
//  Created by ahmed on 5/15/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import "ImageDetails.h"
#import "Product.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"

@implementation Product

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    // model_property_name : json_field_name
    return @{
             @"productID" : @"id",
             @"productDescription" : @"productDescription",
             @"productImageDetails" : @"image",
             @"productPrice" : @"price"
             };
}

+ (NSValueTransformer *)productImageDetailsJSONTransformer
{
    
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[ImageDetails class]];
}

+ (NSArray *)deserializeProductFromJSON:(NSArray *)productJSON
{
    NSError *error;
    NSArray *products = [MTLJSONAdapter modelsOfClass:[Product class] fromJSONArray:productJSON error:&error];
    if (error) {
        NSLog(@"Couldn't convert product JSON to product models: %@", error);
        return nil;
    }
    
    return products;
}

@end
