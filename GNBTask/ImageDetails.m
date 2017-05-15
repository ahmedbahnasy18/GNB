//
//  ImageDetails.m
//  GNBTask
//
//  Created by ahmed on 5/15/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import "ImageDetails.h"

@implementation ImageDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    
    return @{
             @"imageWidth" : @"width",
             @"imageHeight" : @"height",
             @"imageURL" : @"url"
             };
}

@end
