//
//  InvokedChapterViewController.h
//  NSInvocationSample
//
//  Created by saku on 2013/12/19.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import "BaseSQLViewController.h"

@interface InvokedChapterViewController : BaseSQLViewController

@end


@interface InvokedSectionViewController : BaseSQLViewController

@property int chapterId;

@end


@interface InvokedParagraphViewController : BaseSQLViewController

@property int sectionId;

@end
