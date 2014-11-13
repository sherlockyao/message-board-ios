//
//  MBApiRequest+BuildFactory.h
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBApiRequest.h"

@interface MBApiRequest (BuildFactory)

+ (instancetype)requestForLocateBoard;
+ (instancetype)requestForCreateMessage;

@end
