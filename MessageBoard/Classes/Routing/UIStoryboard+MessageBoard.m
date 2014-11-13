//
//  UIStoryboard+MessageBoard.m
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "UIStoryboard+MessageBoard.h"

static NSString *const MainStoryboardName = @"Main";

@implementation UIStoryboard (MessageBoard)

+ (instancetype)mainStoryboard {
  static UIStoryboard *storyboard = nil;
  if (!storyboard) {
    storyboard = [UIStoryboard storyboardWithName:MainStoryboardName bundle:nil];
  }
  return storyboard;
}

@end
