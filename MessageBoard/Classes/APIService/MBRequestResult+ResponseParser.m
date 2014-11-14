//
//  MBRequestResult+ResponseParser.m
//  MessageBoard
//
//  Created by Sherlock on 11/14/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBRequestResult+ResponseParser.h"
#import "NSDictionary+MBUtility.h"

@implementation MBRequestResult (ResponseParser)

+ (instancetype)resultFromDictionaryData:(NSDictionary *)data {
  MBRequestResult *result = [MBRequestResult new];
  result.success = [data booleanForkey:@"success"];

  return result;
}

@end
