//
//  MBBoardInfo+ResponseParser.h
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBBoardInfo.h"

@interface MBBoardInfo (ResponseParser)

+ (instancetype)infoFromDictionaryData:(NSDictionary *)data;

@end
