//
//  MBApiService.m
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBApiService.h"

@interface MBApiService ()

@property (nonatomic, strong) AFHTTPRequestOperationManager *operationManager;

@end

@implementation MBApiService

- (id)init {
  if (self = [super init]) {
    _operationManager = [AFHTTPRequestOperationManager manager];
  }
  return self;
}

+ (id)serviceWithDeleate:(id <MBApiServiceDelegate>)delegate {
  MBApiService *service = [self new];
  service.delegate = delegate;
  return service;
}

- (void)sendRequest:(MBApiRequest *)apiRequest {
  AFHTTPRequestOperation *requestOperation = [apiRequest httpRequestOperationValue];
  [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    [self finishRequest:apiRequest withResponseObject:responseObject error:nil];
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    [self finishRequest:apiRequest withResponseObject:nil error:error];
  }];
  [self.operationManager.operationQueue addOperation:requestOperation];
}

#pragma mark - Private Methods

- (void)finishRequest:(MBApiRequest *)apiRequest withResponseObject:(id)responseObject error:(NSError *)error {
  MBApiResponse *apiResponse = [MBApiResponse new];
  if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
    apiResponse.isSuccess = YES;
    apiResponse.responseObject = apiRequest.responseParser((NSDictionary *)responseObject);
  } else {
    apiResponse.isSuccess = NO;
    apiResponse.message = [error description];
  }
  if ([self.delegate respondsToSelector:@selector(apiService:didFinishRequest:withResponse:)]) {
    [self.delegate apiService:self didFinishRequest:apiRequest withResponse:apiResponse];
  }
}

@end
