//
//  NSDictionary+MBUtility.m
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "NSDictionary+MBUtility.h"

@implementation NSDictionary (MBUtility)

- (BOOL)booleanForkey:(NSString *)key {
  id value = [self valueForKey:key];
  if ([value isKindOfClass:[NSString class]]) {
    return [@"true" isEqualToString:value];
  } else if ([value respondsToSelector:@selector(intValue)]) {
    return 1 == [value intValue];
  } else {
    return NO;
  }
}

- (NSNumber *)integerForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if ([value respondsToSelector:@selector(intValue)]) {
    return [NSNumber numberWithInt:[value intValue]];
  } else {
    return nil;
  }
}

- (NSNumber *)doubleForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if ([value respondsToSelector:@selector(doubleValue)]) {
    return [NSNumber numberWithDouble:[value doubleValue]];
  } else {
    return nil;
  }
}

- (NSString *)stringForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if ([value isKindOfClass:[NSString class]]) {
    return value;
  } else if ([value respondsToSelector:@selector(stringValue)]) {
    return [value stringValue];
  } else {
    return @"";
  }
}

- (NSDictionary *)dictionaryForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if ([value isKindOfClass:[NSDictionary class]]) {
    return value;
  } else {
    return @{};
  }
}

@end
