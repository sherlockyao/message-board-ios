//
//  MBApiResponse.h
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBApiResponse : NSObject

@property (nonatomic, assign) BOOL isSuccess;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) id responseObject;

@end
