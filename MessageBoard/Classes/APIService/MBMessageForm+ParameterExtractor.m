//
//  MBMessageForm+ParameterExtractor.m
//  MessageBoard
//
//  Created by Sherlock on 11/14/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBMessageForm+ParameterExtractor.h"

@implementation MBMessageForm (ParameterExtractor)

- (NSDictionary *)parameters {
  return @{
           @"boardId" : self.boardId,
           @"orderNumber" : @(self.orderNumber),
           @"content" : self.content,
           @"poster" : self.poster
           };
}

@end
