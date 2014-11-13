//
//  NSDictionary+MBUtility.h
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MBUtility)

- (BOOL)booleanForkey:(NSString *)key;

- (NSNumber *)integerForKey:(NSString *)key;
- (NSNumber *)doubleForKey:(NSString *)key;

- (NSString *)stringForKey:(NSString *)key;

- (NSDictionary *)dictionaryForKey:(NSString *)key;

@end
