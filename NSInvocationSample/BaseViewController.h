//
//  BaseViewController.h
//  NSInvocationSample
//
//  Created by saku on 2013/12/17.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BUTTON_WIDTH 200
#define BUTTON_HEIGHT 44
#define PADDING 50

@interface BaseViewController : UIViewController

- (UIButton *)makeTextButton:(NSString *)text;

@end
