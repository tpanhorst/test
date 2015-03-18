//
//  SRUtility.h
//  MainImplementation
//
//  Created by Sreejith Rajan on 19/09/14.
//  Copyright (c) 2014 Sreejith Rajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonManager.h"
#import "ASIFormDataRequest.h"
@interface SRUtility : NSObject
+(NSDictionary*)makeWebServicecallForGetmethod:(NSURL*)Theurl;
+ (NSDictionary *)makeWebServiewCallForGETMethod:(NSURL *)TheUrl withHeaderOne:(NSString*)TheStringOne withHeaderTwo:(NSString*)TheStringTwo withHeaderValueOne:(NSString*)TheValueOne withHeaderValueTwo:(NSString*)TheValueTwo;
+(NSDictionary*)makeWebServiceCallForPOSTMethod:(NSURL*)TheUrl withAppendData:(NSString*)StringToAppend withRequestHeaderOne:(NSString*)HeaderOne withRequestHeaderTwo:(NSString*)HeaderTwo withHeaderValueOne:(NSString*)HeaderValueOne withHeaderValueTwo:(NSString*)HeaderValueTwo;
+(void)addtoplist:(id)Value key:(NSString *)key plist:(NSString *)plist;
+(void)adddatatoplist:(NSData *)Value key:(NSString *)key plist:(NSString *)plist;
+(NSString *)getfromplist:(NSString *)key plist:(NSString *)plist;
+(NSDictionary *)getdictfromplist:(NSString *)key plist:(NSString *)plist;
+(NSData *)getdatafromplist:(NSString *)key plist:(NSString *)plist;
@end
