//
//  PassParamsViewController.m
//  NSInvocationSample
//
//  Created by saku on 2013/12/17.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import "PassParamsViewController.h"
#import "Invoker.h"

@interface PassParamsViewController ()

@property Invoker *invoker;

@end

@implementation PassParamsViewController

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
    NSString *message = button.titleLabel.text;
    
    // invocate method by NSInvocation.
    // need ":" at last, when use params
    SEL selector = NSSelectorFromString(@"invoke:");
    NSMethodSignature *signature = [_invoker methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:selector];
    [invocation setTarget:_invoker];
    [invocation setArgument:&message atIndex:2];
    [invocation invoke];
}

- (void)classMethodCall:(UIButton *)button
{
    NSString *message = button.titleLabel.text;
    
    // invocate method by NSInvocation.
    // need ":" at last, when use params
    SEL selector = NSSelectorFromString(@"invokeClassMethod:");
    NSMethodSignature *signature = [[Invoker class] methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:selector];
    [invocation setTarget:[Invoker class]];
    [invocation setArgument:&message atIndex:2];
    [invocation invoke];
}

@end
