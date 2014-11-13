//
//  MBApiRequest.m
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBApiRequest.h"

@implementation MBApiRequest

#pragma mark - Public Methods

- (AFHTTPRequestOperation *)httpRequestOperationValue {
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:self.url]];
  [request setHTTPMethod:[self methodName]];
  AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
  requestOperation.responseSerializer = [AFJSONResponseSerializer serializer];
  return requestOperation;
}

#pragma mark - Private Methods

- (NSString *)methodName {
  NSString *methodName = @"GET";
  switch (self.method) {
    case MBApiRequestMethodPost:
      methodName = @"POST";
      break;
      
    case MBApiRequestMethodPut:
      methodName = @"PUT";
      break;
      
    case MBApiRequestMethodDelete:
      methodName = @"DELETE";
      break;
      
    default:
      break;
  }
  return methodName;
}


@end
