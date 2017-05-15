//
//  ImageDetails.h
//  GNBTask
//
//  Created by ahmed on 5/15/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface ImageDetails : MTLModel <MTLJSONSerializing>

@property (nonatomic ,copy) NSNumber *imageWidth;
@property (nonatomic ,copy) NSNumber *imageHeight;
@property (nonatomic ,copy) NSString *imageURL;

@end
