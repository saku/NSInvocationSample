//
//  BaseSQLViewController.h
//  NSInvocationSample
//
//  Created by saku on 2013/12/19.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DaoConstants.h"

@interface BaseSQLViewController : UITableViewController

@property NSArray *items;

@end


@interface ChapterViewController : BaseSQLViewController
@end


@interface SectionViewController : BaseSQLViewController
@end


@interface ParagraphViewController : BaseSQLViewController
@end
