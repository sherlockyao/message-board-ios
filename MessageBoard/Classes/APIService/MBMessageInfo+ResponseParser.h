//
//  MBMessageInfo+ResponseParser.h
//  MessageBoard
//
//  Created by Sherlock on 11/14/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBMessageInfo.h"

@interface MBMessageInfo (ResponseParser)

+ (instancetype)infoFromDictionaryData:(NSDictionary *)data;

@end
