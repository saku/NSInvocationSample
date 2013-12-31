//
//  Invoker.h
//  NSInvocationSample
//
//  Created by saku on 2013/12/17.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Invoker : NSObject

- (void)invoke;
- (void)invoke:(NSString *)message;
- (NSString *)invokeWithReturnValue;
+ (void)invokeClassMethod;
+ (void)invokeClassMethod:(NSString *)message;
+ (NSString *)invokeClassMethodWithReturnValue;

+ (instancetype)sharedInstance;
+ (void)showAlertView:(NSString *)message;

@end
