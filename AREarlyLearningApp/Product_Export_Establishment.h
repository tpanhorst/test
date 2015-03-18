//
//  Product_Export_Establishment.h
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 07/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Product_Export_Establishment : NSManagedObject

@property (nonatomic, retain) NSString * productClass;
@property (nonatomic, retain) NSString * productCategory;
@property (nonatomic, retain) NSString * productSubcategory;
@property (nonatomic, retain) NSString * productName;
@property (nonatomic, retain) NSString * productDescription;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSString * cost;
@property (nonatomic, retain) NSString * tax;
@property (nonatomic, retain) NSString * sku;
@property (nonatomic, retain) NSString * barCode;

@end
