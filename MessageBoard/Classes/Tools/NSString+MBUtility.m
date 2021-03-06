//
//  NSString+MBUtility.m
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "NSString+MBUtility.h"

@implementation NSString (MBUtility)

- (NSString *)conj:(NSString *)str {
  return [NSString stringWithFormat:@"%@%@", self, (str ? str : @"")];
}

@end
