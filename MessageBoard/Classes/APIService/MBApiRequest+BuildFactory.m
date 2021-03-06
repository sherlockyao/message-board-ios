//
//  MBApiRequest+BuildFactory.m
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBApiRequest+BuildFactory.h"
#import "MBConfig.h"
#import "MBMessageForm+ParameterExtractor.h"
#import "MBBoardInfo+ResponseParser.h"
#import "MBRequestResult+ResponseParser.h"

static NSString *const LocateBoardPath = @"/board";
static NSString *const CreateMessagePath = @"/message";

@implementation MBApiRequest (BuildFactory)

+ (instancetype)requestForLocateBoard {
  MBApiRequest *request = [self requestForPath:LocateBoardPath type:MBApiRequestLocateBoard method:MBApiRequestMethodGet];
  request.responseParser = ^id(NSDictionary *data) {
    return [MBBoardInfo infoFromDictionaryData:data];
  };
  return request;
}

+ (instancetype)requestForCreateMessage:(MBMessageForm *)messageForm {
  MBApiRequest *request = [self requestForPath:LocateBoardPath type:MBApiRequestLocateBoard method:MBApiRequestMethodPost];
  [request addParameters:[messageForm parameters]];
  request.responseParser = ^id(NSDictionary *data) {
    return [MBRequestResult resultFromDictionaryData:data];
  };
  return request;
}

#pragma mark - Private Methods

+ (instancetype)requestForPath:(NSString *)path type:(MBApiRequestType)type method:(MBApiRequestMethod)method {
  MBApiRequest *request = [self new];
  request.url = [NSString stringWithFormat:@"%@%@", APIServerHost, path];;
  request.type = type;
  request.method = method;
  
  return request;
}

@end
