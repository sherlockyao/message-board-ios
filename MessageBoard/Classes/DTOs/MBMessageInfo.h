//
//  MBMessageInfo.h
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBMessageInfo : NSObject

@property (nonatomic, assign) NSInteger orderNumber;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *poster;
@property (nonatomic, assign) NSNumber *timestamp;

@end
