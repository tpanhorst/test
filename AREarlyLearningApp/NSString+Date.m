//
//  NSString+Date.m
//  GraysDerm 2.0
//
//  Created by ariva on 14/07/14.
//  Copyright (c) 2014 arivameddata. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)
+ (NSDateFormatter*)stringDateFormatter
{
    static NSDateFormatter* formatter = nil;
    if (formatter == nil)
    {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
    }
    return formatter;
}
+(NSDateFormatter*)stringDateAndTimeFormatter
{
    static NSDateFormatter* formatter=nil;
    if (formatter==nil)
    {
        formatter=[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd'  'h:mm:ss a"];
    }
    return formatter;
}
+ (NSDateFormatter*)string_cDateFormatter
{
    static NSDateFormatter* cformatter = nil;
    if (cformatter == nil)
    {
        cformatter = [[NSDateFormatter alloc] init];
        [cformatter setDateFormat:@"MM/dd/yyyy"];
    }
    return cformatter;
}
- (NSDate*)DateFromString:(NSString*)string
{
    NSDate *Date= [[NSString stringDateFormatter] dateFromString:string];
    return  Date;
}
- (NSString*)StringFromDate:(NSDate*)date
{
    NSString *Str=[[NSString stringDateFormatter] stringFromDate:date];
    return Str;
}
-(NSString*)StringDateAndTime:(NSDate*)date
{
    NSString *str=[[NSString stringDateAndTimeFormatter] stringFromDate:date];
    return str;
}
- (NSString*)StringFrom_cDate:(NSDate*)cdate
{
    NSString *Str=[[NSString string_cDateFormatter] stringFromDate:cdate];
    return Str;
}
+(NSString *)StrDate:(NSString *)strDateFromSERVER
{
    NSString *StrDS=@"";
    NSDate *DatePIA=[StrDS DateFromString:strDateFromSERVER];
    StrDS=[StrDS StringFrom_cDate:DatePIA];
    return StrDS;
}
-(NSString *)StringThisOld:(NSString *)StrDate
{
    NSString *StrThisOld=@"";
    NSDate *Date2=[NSDate date];
    NSDateComponents *componentYear = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:[StrDate DateFromString:StrDate] toDate:Date2 options:0];
    NSDateComponents *componentMonth = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:[StrDate DateFromString:StrDate] toDate:Date2 options:0];
    StrThisOld=[NSString stringWithFormat:@"%d Years %d Month Old",componentYear.year,componentMonth.month%12];
    return  StrThisOld;
}
@end
