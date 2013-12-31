//
//  ClassMethodInvokeViewController.m
//  NSInvocationSample
//
//  Created by saku on 2013/12/17.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import "ClassMethodInvokeViewController.h"
#import "Invoker.h"

@interface ClassMethodInvokeViewController ()

@end

@implementation ClassMethodInvokeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIButton *button;
    CGPoint viewCenter = self.view.center;
    
    // make normal button.
    button = [self makeTextButton:@"Normal Class Method"];
    button.center = CGPointMake(viewCenter.x, viewCenter.y - PADDING);
    [button addTarget:self action:@selector(normal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // make invoke button.
    button = [self makeTextButton:@"Invoke Class Method"];
    button.center = CGPointMake(viewCenter.x, viewCenter.y + PADDING);
    [button addTarget:self action:@selector(invoke) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)normal
{
    [Invoker invokeClassMethod];
}

- (void)invoke
{
    // invocate method by NSInvocation.
    SEL selector = NSSelectorFromString(@"invokeClassMethod");
    NSMethodSignature *signature = [[Invoker class] methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:selector];
    [invocation setTarget:[Invoker class]];
    [invocation invoke];
}

@end
