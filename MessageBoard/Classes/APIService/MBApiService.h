//
//  MBApiService.h
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBApiRequest.h"
#import "MBApiResponse.h"

@protocol MBApiServiceDelegate;

@interface MBApiService : NSObject

@property(nonatomic, weak) NSObject <MBApiServiceDelegate> *delegate;

+ (id)serviceWithDeleate:(id <MBApiServiceDelegate>)delegate;

- (void)sendRequest:(MBApiRequest *)apiRequest;

@end


@protocol MBApiServiceDelegate <NSObject>

@optional
- (void)apiService:(MBApiService *)service didFinishRequest:(MBApiRequest *)request withResponse:(MBApiResponse *)response;

@end
