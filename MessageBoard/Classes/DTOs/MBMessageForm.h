//
//  MBMessageForm.h
//  MessageBoard
//
//  Created by Sherlock on 11/14/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBMessageForm : NSObject

@property (nonatomic, strong) NSString *boardId;
@property (nonatomic, assign) NSInteger orderNumber;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *poster;

@end
