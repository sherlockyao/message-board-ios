//
//  MBMessageInfo+ResponseParser.m
//  MessageBoard
//
//  Created by Sherlock on 11/14/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBMessageInfo+ResponseParser.h"
#import "NSDictionary+MBUtility.h"

@implementation MBMessageInfo (ResponseParser)

+ (instancetype)infoFromDictionaryData:(NSDictionary *)data {
  MBMessageInfo *messageInfo = [MBMessageInfo new];
  messageInfo.orderNumber = [[data integerForKey:@"orderNumber"] integerValue];
  messageInfo.content = [data stringForKey:@"content"];
  messageInfo.poster = [data stringForKey:@"poster"];
  messageInfo.timestamp = [data integerForKey:@"timestamp"];
  
  return messageInfo;
}

@end
