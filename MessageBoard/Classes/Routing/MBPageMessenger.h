//
//  MBPageMessenger.h
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBPageMessenger : NSObject

+ (instancetype)messenger;
+ (instancetype)messengerWithName:(NSString *)name;

+ (NSString *)defaultName;

- (void)addParam:(NSString *)name value:(id)value;

- (NSString *)name;
- (NSDictionary *)params;

@end
