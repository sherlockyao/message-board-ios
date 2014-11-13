//
//  UIViewController+MBWireframe.m
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "UIViewController+MBWireframe.h"
#import "NSString+MBUtility.h"

@implementation UIViewController (MBWireframe)

+ (NSString *)wireframeKey:(NSString *)name {
  return [[[self class] description] conj:name];
}

@end
