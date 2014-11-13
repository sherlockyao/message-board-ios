//
//  MBWireframe.m
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBWireframe.h"
#import "NSString+MBUtility.h"

@implementation MBWireframe

+ (UIViewController *)entryPoint {
  //TODO:
  return nil;
}

+ (void)moveToNextPageOfViewController:(UIViewController *)viewController {
  [self moveToNextPageOfViewController:viewController messenger:[MBPageMessenger messenger]];
}

+ (void)moveToNextPageOfViewController:(UIViewController *)viewController messenger:(MBPageMessenger *)messenger {
  SEL selector = [self selectorOfClass:[viewController class] messengerName:[messenger name]];
  IMP imp = [[self class] methodForSelector:selector];
  void (*func)(id, SEL, UIViewController*, NSDictionary*) = (void *)imp;
  func([self class], selector, viewController, [messenger params]);
}

+ (void)moveToPreviousPageOfViewController:(UIViewController *)viewController {
  [viewController.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Navigation Methods


#pragma mark - Private Methods

+ (SEL)selectorOfClass:(Class)class messengerName:(NSString *)messengerName {
  static NSDictionary *selectorMap = nil;
  if (!selectorMap) {
    selectorMap = @{
                    
                    };
  }
  NSValue *value = [selectorMap valueForKey:[[class description] conj:messengerName]];
  return value ? [value pointerValue] : @selector(emptyMove:params:);
}

+ (void)emptyMove:(UIViewController *)viewController params:(NSDictionary *)params {
  // empty method for a nil selector
}


@end
