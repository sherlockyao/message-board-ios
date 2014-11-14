//
//  MBApiRequest.m
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBApiRequest.h"

@interface MBApiRequest ()

@property (nonatomic, strong) NSMutableDictionary *parameters;

@end


@implementation MBApiRequest

- (id)init {
  if (self = [super init]) {
    _parameters = [NSMutableDictionary dictionary];
  }
  return self;
}

#pragma mark - Public Methods

- (void)addParameters:(NSDictionary *)parameters {
  [self.parameters addEntriesFromDictionary:parameters];
}

- (void)addParameter:(NSString *)name value:(id)value {
  [self.parameters setObject:value forKey:name];
}

- (AFHTTPRequestOperation *)httpRequestOperationValue {
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:self.url]];
  [request setHTTPMethod:[self methodName]];
  [request setHTTPBody:[self bodyData]];
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

- (NSData *)bodyData {
  if (MBApiRequestMethodPost == self.method) {
    return [[self parametersString] dataUsingEncoding:NSUTF8StringEncoding];
  } else {
    return nil;
  }
}

- (NSString *)parametersString {
  NSMutableArray *parts = [NSMutableArray array];
  for (NSString *key in [self.parameters allKeys]) {
    NSString *part = [NSString stringWithFormat:@"%@=%@", key, [self.parameters valueForKey:key]];
    [parts addObject: part];
  }
  
  return [parts componentsJoinedByString: @"&"];
}

@end
