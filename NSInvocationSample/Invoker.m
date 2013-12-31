//
//  Invoker.m
//  NSInvocationSample
//
//  Created by saku on 2013/12/17.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import "Invoker.h"

@implementation Invoker

- (void)invoke
{
    [self invoke:@"invoke"];
}

- (void)invoke:(NSString *)message
{
    [[self class] showAlertView:message];
}

- (NSString *)invokeWithReturnValue
{
    return @"invoke return val";
}

+ (void)invokeClassMethod
{
    [Invoker invokeClassMethod:@"invoke"];
}

+ (void)invokeClassMethod:(NSString *)message
{
    [Invoker showAlertView:message];
}

+ (NSString *)invokeClassMethodWithReturnValue
{
    return @"invoke class return val";
}

+ (instancetype)sharedInstance
{
    static Invoker *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[Invoker alloc] init];
    });

    return _sharedInstance;
}

+ (void)showAlertView:(NSString *)message
{
    [[[UIAlertView alloc] initWithTitle:NSStringFromClass([self class])
                                message:message
                               delegate:nil
                      cancelButtonTitle:nil
                      otherButtonTitles:@"OK", nil] show];
}

@end
