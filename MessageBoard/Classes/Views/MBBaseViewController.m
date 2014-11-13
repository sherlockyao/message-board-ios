//
//  MBBaseViewController.m
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBBaseViewController.h"
#import "MBBasePresenter.h"

@implementation MBBaseViewController

- (id)init {
  self = [super init];
  if (self) {
    [self privateInit];
  }
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self privateInit];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  for (MBBasePresenter *presenter in [self presenters]) {
    [presenter viewDidLoad:self];
  }
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  if (self.needObserveKeyboardAppearance) {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
  }
  if (self.needTapAnywhereToHideKeyboard) {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(autoDismissKeyboardGestureAction:)];
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillShowNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
      [self.view addGestureRecognizer:tapGesture];
    }];
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
      [self.view removeGestureRecognizer:tapGesture];
    }];
  }
  for (MBBasePresenter *presenter in [self presenters]) {
    [presenter view:self willAppear:animated];
  }
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  for (MBBasePresenter *presenter in [self presenters]) {
    [presenter view:self didAppear:animated];
  }
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  if (self.needObserveKeyboardAppearance) {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
  }
  for (MBBasePresenter *presenter in [self presenters]) {
    [presenter view:self willDisappear:animated];
  }
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  for (MBBasePresenter *presenter in [self presenters]) {
    [presenter view:self didDisappear:animated];
  }
}

- (NSArray *)presenters {
  return @[];
}

- (void)keyboardWillShow:(NSNotification *)notification {}

- (void)keyboardWillHide:(NSNotification *)notification {}

- (CGFloat)animateDuration:(CGFloat)duration {
  return self.needInstantAnimation ? 0.f : duration;
}

#pragma mark Private Methods

- (void)privateInit {
  _needInstantAnimation = NO;
  _needObserveKeyboardAppearance = NO;
  _needTapAnywhereToHideKeyboard = NO;
  _params = @{};
}

- (void)autoDismissKeyboardGestureAction:(UIGestureRecognizer *)gestureRecognizer {
  [self.view endEditing:YES];
}

@end
