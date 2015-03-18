//
//  SRUtility.m
//  MainImplementation
//
//  Created by Sreejith Rajan on 19/09/14.
//  Copyright (c) 2014 Sreejith Rajan. All rights reserved.
//

#import "SRUtility.h"

@implementation SRUtility
#pragma mark
#pragma mark WebService Utility
+(NSDictionary*)makeWebServicecallForGetmethod:(NSURL*)Theurl
{
    JsonManager *json = [[JsonManager alloc]init];
    ASIFormDataRequest *theRequest = [ASIFormDataRequest requestWithURL:Theurl];
    [theRequest setValidatesSecureCertificate:NO];
    [theRequest setRequestMethod:@"GET"];
    [theRequest startSynchronous];
    NSError *error = [theRequest error];
	NSDictionary *dicJsonValues;
	if (!error)
	{    NSString *response = [theRequest responseString];
        if ([response length] == 0 || [response isEqualToString:@""])
		     dicJsonValues = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:false], @"success", nil];
        else
		    dicJsonValues = [json JsonToDictionary:response];
    }
    else
	   dicJsonValues = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSNumber numberWithBool:false], @"success", nil];
    return dicJsonValues;
}
+ (NSDictionary *)makeWebServiewCallForGETMethod:(NSURL *)TheUrl withHeaderOne:(NSString*)TheStringOne withHeaderTwo:(NSString*)TheStringTwo withHeaderValueOne:(NSString*)TheValueOne withHeaderValueTwo:(NSString*)TheValueTwo
{
    JsonManager *json = [[JsonManager alloc]init];
    ASIFormDataRequest *theRequest = [ASIFormDataRequest requestWithURL:TheUrl];
    [theRequest setValidatesSecureCertificate:NO];
    [theRequest setRequestMethod:@"GET"];
    [theRequest addRequestHeader:TheStringOne value:TheValueOne];
    [theRequest addRequestHeader:TheStringTwo value:TheValueTwo];
    [theRequest startSynchronous];
	NSError *error = [theRequest error];
	NSDictionary *dicJsonValues;
	if (!error)
	{
        NSString *response = [theRequest responseString];
        if ([response length] == 0 || [response isEqualToString:@""])
		{
			dicJsonValues = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:false], @"success", nil];
        }
        else
		{
            dicJsonValues = [json JsonToDictionary:response];
            
        }
	}
    else
	{
        dicJsonValues = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSNumber numberWithBool:false], @"success", nil];
	}
	
	return dicJsonValues;
}
+(NSDictionary*)makeWebServiceCallForPOSTMethod:(NSURL*)TheUrl withAppendData:(NSDictionary*)StringToAppend withRequestHeaderOne:(NSString*)HeaderOne withRequestHeaderTwo:(NSString*)HeaderTwo withHeaderValueOne:(NSString*)HeaderValueOne withHeaderValueTwo:(NSString*)HeaderValueTwo
{


    JsonManager *json = [[JsonManager alloc]init];
    ASIFormDataRequest *theRequest = [ASIFormDataRequest requestWithURL:TheUrl];
    [theRequest setValidatesSecureCertificate:NO];
    [theRequest setRequestMethod:@"POST"];
    [theRequest addRequestHeader:HeaderOne value:HeaderValueOne];
   [theRequest addRequestHeader:HeaderTwo value:HeaderValueTwo];
    NSData *TheData=[NSKeyedArchiver archivedDataWithRootObject:StringToAppend];
    
    [theRequest appendPostData:TheData];
    
    [theRequest startSynchronous];
    
    
	NSError *error = [theRequest error];
	NSDictionary *dicJsonValues;
	if (!error)
	{
        NSString *response = [theRequest responseString];
        if ([response length] == 0 || [response isEqualToString:@""])
		{
			//dicJsonValues = [NSDictionary dictionaryWithObjectsAndKeys:
                             //[NSNumber numberWithBool:false], @"success", nil];
        }
        else
		{
            dicJsonValues = [json JsonToDictionary:response];
            
        }
	}
    else
	{
        dicJsonValues = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSNumber numberWithBool:false], @"success", nil];
	}
	
	return dicJsonValues;

}
#pragma mark
#pragma mark PList Utility
+(void)addtoplist:(id)Value key:(NSString *)key plist:(NSString *)plist
{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [path objectAtIndex:0];
    NSString *finalPath = [documentsDirectoryPath stringByAppendingPathComponent:[plist stringByAppendingString:@".plist"] ];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath: finalPath])
    {
        NSString *bundle = [[NSBundle mainBundle]pathForResource:plist ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath: finalPath error:nil];
    }
    
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:finalPath];
    [plistDict setValue:Value forKey:key];
    [plistDict writeToFile:finalPath atomically: YES];
}
+(void)adddatatoplist:(NSData *)Value key:(NSString *)key plist:(NSString *)plist
{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [path objectAtIndex:0];
    NSString *finalPath = [documentsDirectoryPath stringByAppendingPathComponent:[plist stringByAppendingString:@".plist"] ];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath: finalPath])
    {
        NSString *bundle = [[NSBundle mainBundle]pathForResource:plist ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath: finalPath error:nil];
    }
    
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:finalPath];
    [plistDict setValue:Value forKey:key];
    [plistDict writeToFile:finalPath atomically: YES];
    
    //NSLog(@"key: %@, value: %@", key, [plistDict objectForKey:key]);
}
+(NSString *)getfromplist:(NSString *)key plist:(NSString *)plist
{
    
    
    NSArray *path1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [path1 objectAtIndex:0];
    NSString *finalPath1 = [documentsDirectoryPath stringByAppendingPathComponent:[plist stringByAppendingString:@".plist"]];
    
    NSMutableDictionary* plistDict1 = [[NSMutableDictionary alloc] initWithContentsOfFile:finalPath1];
    NSString *value;
    value = [plistDict1 valueForKey:key];
    
    return value;
    
}
+(NSDictionary *)getdictfromplist:(NSString *)key plist:(NSString *)plist
{
    NSArray *path1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [path1 objectAtIndex:0];
    NSString *finalPath1 = [documentsDirectoryPath stringByAppendingPathComponent:[plist stringByAppendingString:@".plist"]];
    
    NSMutableDictionary* plistDict1 = [[NSMutableDictionary alloc] initWithContentsOfFile:finalPath1];
    NSDictionary *value;
    value = [plistDict1 valueForKey:key];
    return value;
    
}
+(NSData *)getdatafromplist:(NSString *)key plist:(NSString *)plist
{
    NSArray *path1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [path1 objectAtIndex:0];
    NSString *finalPath1 = [documentsDirectoryPath stringByAppendingPathComponent:[plist stringByAppendingString:@".plist"]];
    
    NSMutableDictionary* plistDict1 = [[NSMutableDictionary alloc] initWithContentsOfFile:finalPath1];
    NSData *value;
    value = [plistDict1 valueForKey:key];
    return value;
    
}


@end
