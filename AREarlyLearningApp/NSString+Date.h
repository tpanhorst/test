//
//  NSString+Date.h
//  GraysDerm 2.0
//
//  Created by ariva on 14/07/14.
//  Copyright (c) 2014 arivameddata. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)
- (NSDate*)DateFromString:(NSString*)string;
- (NSString*)StringFromDate:(NSDate*)date;
- (NSString*)StringFrom_cDate:(NSDate*)cdate;
-(NSString *)StringThisOld:(NSString *)StrDate;
+(NSString *)StrDate:(NSString *)strDateFromSERVER;
-(NSString*)StringDateAndTime:(NSDate*)date;
@end

