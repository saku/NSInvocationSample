//
//  GetReturnValueViewController.m
//  NSInvocationSample
//
//  Created by saku on 2013/12/18.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import "GetReturnValueViewController.h"
#import "Invoker.h"

@interface GetReturnValueViewController ()

@property Invoker *invoker;

@end

@implementation GetReturnValueViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    _invoker = [Invoker sharedInstance];
    
    UIButton *button;
    CGPoint viewCenter = self.view.center;
    
    // make normal button.
    button = [self makeTextButton:@"InstanceMethodCall"];
    button.center = CGPointMake(viewCenter.x, viewCenter.y - PADDING);
    [button addTarget:self action:@selector(instanceMethodCall:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // make invoke button.
    button = [self makeTextButton:@"ClassMethodCall"];
    button.center = CGPointMake(viewCenter.x, viewCenter.y + PADDING);
    [button addTarget:self action:@selector(classMethodCall:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)instanceMethodCall:(UIButton *)button
{
    // invocate method by NSInvocation.
    SEL selector = NSSelectorFromString(@"invokeWithReturnValue");
    NSMethodSignature *signature = [_invoker methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:selector];
    [invocation setTarget:_invoker];
    [invocation invoke];

    // get return val.
    NSString *message;
    [invocation getReturnValue:&message];
    [Invoker showAlertView:message];
}

- (void)classMethodCall:(UIButton *)button
{
    // invocate method by NSInvocation.
    SEL selector = NSSelectorFromString(@"invokeClassMethodWithReturnValue");
    NSMethodSignature *signature = [[Invoker class] methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:selector];
    [invocation setTarget:[Invoker class]];
    [invocation invoke];

    // get return val.
    NSString *message;
    [invocation getReturnValue:&message];
    [Invoker showAlertView:message];
}

@end
