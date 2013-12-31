//
//  SimpleChapterViewController.h
//  NSInvocationSample
//
//  Created by saku on 2013/12/19.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import "BaseSQLViewController.h"

@interface SimpleChapterViewController : BaseSQLViewController

@end

@interface SimpleSectionViewController : BaseSQLViewController

@property int chapterId;

@end


@interface SimpleParagraphViewController : BaseSQLViewController

@property int sectionId;

@end
