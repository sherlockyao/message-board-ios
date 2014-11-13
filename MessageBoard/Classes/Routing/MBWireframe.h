//
//  MBWireframe.h
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBPageMessenger.h"

@interface MBWireframe : NSObject

+ (UIViewController *)entryPoint;

+ (void)moveToNextPageOfViewController:(UIViewController *)viewController;
+ (void)moveToNextPageOfViewController:(UIViewController *)viewController messenger:(MBPageMessenger *)messenger;

+ (void)moveToPreviousPageOfViewController:(UIViewController *)viewController;

@end
