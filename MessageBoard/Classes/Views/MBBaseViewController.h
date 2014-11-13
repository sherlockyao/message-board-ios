//
//  MBBaseViewController.h
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBBaseViewController : UIViewController

@property (nonatomic, assign) BOOL needInstantAnimation; // default NO
@property (nonatomic, assign) BOOL needObserveKeyboardAppearance; // default NO
@property (nonatomic, assign) BOOL needTapAnywhereToHideKeyboard; // default NO

@property (nonatomic, strong) NSDictionary *params;

- (NSArray *)presenters; // Overwrite this method to return all the presetners that want to have view related call backs, like viewDidLoad: etc.

- (void)keyboardWillShow:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;

- (CGFloat)animateDuration:(CGFloat)duration;

@end
