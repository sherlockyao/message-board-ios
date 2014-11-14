//
//  MBBoardInfo.h
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBBoardInfo : NSObject

@property (nonatomic, strong) NSString *boardId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger messageCount;

@property (nonatomic, strong) NSArray *messages;

@end
