    //
//  JsonManager.m
//  JsonHandler
//
//  Created by raees on 29/03/11..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "JsonManager.h"
#import "JSON.h"

@implementation JsonManager



-(NSDictionary *) JsonToDictionary:(NSString *)jsonstring
{
	SBJsonParser *parser = [[SBJsonParser alloc] init];
	NSDictionary *object = [jsonstring JSONValue];//[parser objectWithString:jsonstring error:nil];
	
	
	[parser release];
	return object;
}



- (NSString *) DictionaryToJson: (NSDictionary *)dictionary
{
	NSString* jsonString = [dictionary JSONRepresentation];
	return jsonString;
}



- (void)dealloc 
{
    [super dealloc];
}

@end
