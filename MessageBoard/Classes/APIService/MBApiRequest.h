//
//  MBApiRequest.h
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef enum {
  MBApiRequestLocateBoard,
  MBApiRequestCreateMessage,
} MBApiRequestType;

typedef enum {
  MBApiRequestMethodGet,
  MBApiRequestMethodPost,
  MBApiRequestMethodDelete,
  MBApiRequestMethodPut,
} MBApiRequestMethod;

typedef id (^MBApiResponseParser)(NSDictionary *data);


@interface MBApiRequest : NSObject

@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) MBApiRequestType type;
@property (nonatomic, assign) MBApiRequestMethod method;
@property(nonatomic,copy) MBApiResponseParser responseParser;

- (AFHTTPRequestOperation *)httpRequestOperationValue;

@end
