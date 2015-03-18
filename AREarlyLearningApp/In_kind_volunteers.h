//
//  In_kind_volunteers.h
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 08/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface In_kind_volunteers : NSManagedObject

@property (nonatomic, retain) NSString * userId;
@property (nonatomic, retain) NSString * fname;
@property (nonatomic, retain) NSString * lname;
@property (nonatomic, retain) NSString * cellNum;
@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSString * street;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * cntry;
@property (nonatomic, retain) NSString * pin;
@property (nonatomic, retain) NSString * street2;

@end
