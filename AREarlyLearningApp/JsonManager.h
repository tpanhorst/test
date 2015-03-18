//
//  JsonManager.h
//  JsonHandler
//
//  Created by raees on 29/03/11..
//  Copyright 2011 __Experion__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JsonManager : NSObject 
{

}

- (NSDictionary *) JsonToDictionary: (NSString *)jsonstring;
- (NSString *) DictionaryToJson: (NSDictionary *)dictionary;

@end
