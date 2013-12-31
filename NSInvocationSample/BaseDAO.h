//
//  BaseDAO.h
//  NSInvocationSample
//
//  Created by saku on 2013/12/18.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface BaseDAO : NSObject

+ (NSArray *)getAllChapter;
+ (NSArray *)getAllSection;
+ (NSArray *)getAllParagraph;

+ (NSString *) getDBFileName;

+ (NSDictionary *)createChapter:(sqlite3_stmt *)statement;
+ (NSDictionary *)createSection:(sqlite3_stmt *)statement;
+ (NSDictionary *)createParagraph:(sqlite3_stmt *)statement;

@end
