//
//  SimpleDAO.h
//  NSInvocationSample
//
//  Created by saku on 2013/12/18.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import "BaseDAO.h"

@interface SimpleDAO : BaseDAO

+ (NSArray *)getAllChapter;
+ (NSArray *)getAllSection;
+ (NSArray *)getAllParagraph;

+ (NSArray *)getSectionsByChapterId:(int)chapterId;
+ (NSArray *)getParagraphsBySectionId:(int)sectionId;

@end
