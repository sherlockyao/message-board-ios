//
//  MBRequestResult+ResponseParser.h
//  MessageBoard
//
//  Created by Sherlock on 11/14/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBRequestResult.h"

@interface MBRequestResult (ResponseParser)

+ (instancetype)resultFromDictionaryData:(NSDictionary *)data;

@end
