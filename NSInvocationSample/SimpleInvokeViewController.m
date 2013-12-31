//
//  SimpleInvokeViewController.m
//  NSInvocationSample
//
//  Created by saku on 2013/12/17.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import "SimpleInvokeViewController.h"
#import "Invoker.h"

@interface SimpleInvokeViewController ()

@property Invoker *invoker;

@end

@implementation SimpleInvokeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    _invoker = [Invoker sharedInstance];

    UIButton *button;
    CGPoint viewCenter = self.view.center;

    // make normal button.
    button = [self makeTextButton:@"Normal"];
    button.center = CGPointMake(viewCenter.x, viewCenter.y - PADDING);
    [button addTarget:self action:@selector(normal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    // make invoke button.
    button = [self makeTextButton:@"Invoke"];
    button.center = CGPointMake(viewCenter.x, viewCenter.y + PADDING);
    [button addTarget:self action:@selector(invoke) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)normal
{
    [_invoker invoke];
}

- (void)invoke
{
    // invocate method by NSInvocation.
    SEL selector = NSSelectorFromString(@"invoke");
    NSMethodSignature *signature = [_invoker methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:selector];
    [invocation setTarget:_invoker];
    [invocation invoke];
}

@end
