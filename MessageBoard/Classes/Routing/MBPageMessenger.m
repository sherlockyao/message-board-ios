//
//  MBPageMessenger.m
//  MessageBoard
//
//  Created by Sherlock on 11/13/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "MBPageMessenger.h"

static NSString *const DefaultName = @"Default";

@interface MBPageMessenger ()

@property (nonatomic, strong) NSString *theName;
@property (nonatomic, strong) NSMutableDictionary *parameters;

@end

@implementation MBPageMessenger

- (id)init {
  self = [super init];
  if (self) {
    _parameters = [NSMutableDictionary dictionary];
  }
  return self;
}

+ (instancetype)messenger {
  return [self messengerWithName:DefaultName];
}

+ (instancetype)messengerWithName:(NSString *)name {
  MBPageMessenger *messenger = [MBPageMessenger new];
  messenger.theName = name;
  return messenger;
}

+ (NSString *)defaultName {
  return DefaultName;
}

- (void)addParam:(NSString *)name value:(id)value {
  [self.parameters setValue:value forKeyPath:name];
}

- (NSString *)name {
  return self.theName ? self.theName : DefaultName;
}

- (NSDictionary *)params {
  return [NSDictionary dictionaryWithDictionary:self.parameters];
}

@end
