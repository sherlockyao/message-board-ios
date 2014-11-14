//
//  MBBoardInfo+ResponseParser.m
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBBoardInfo+ResponseParser.h"
#import "MBMessageInfo+ResponseParser.h"
#import "NSDictionary+MBUtility.h"

@implementation MBBoardInfo (ResponseParser)

+ (instancetype)infoFromDictionaryData:(NSDictionary *)data {
  MBBoardInfo *boardInfo = [MBBoardInfo new];
  boardInfo.title = [data stringForKey:@"title"];
  boardInfo.messageCount = [[data integerForKey:@"messageCount"] integerValue];
  NSArray *messagesData = [data arrayForKey:@"messages"];
  NSMutableArray *messages = [NSMutableArray arrayWithCapacity:[messagesData count]];
  for (NSDictionary *messageData in messagesData) {
    [messages addObject:[MBMessageInfo infoFromDictionaryData:messageData]];
  }
  boardInfo.messages = [NSArray arrayWithArray:messages];
  
  return boardInfo;
}

@end
