//
//  SimpleDAO.m
//  NSInvocationSample
//
//  Created by saku on 2013/12/18.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import "SimpleDAO.h"
#import "DaoConstants.h"

@implementation SimpleDAO

+ (NSArray *)getAllChapter
{
	NSMutableArray *result = [NSMutableArray array];
	NSString *dbFile = [[self class] getDBFileName];
	sqlite3 *database = nil;
	sqlite3_stmt *statement = nil;
	
	if (sqlite3_open([dbFile UTF8String], &database) != SQLITE_OK) {
		sqlite3_close(database);
		return result;
	}
    
    NSString *sql = @"SELECT * FROM chapter";
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSDictionary *dataDictionary = [[self class] createChapter:statement];
            [result addObject:[NSDictionary dictionaryWithDictionary:dataDictionary]];
        }
        sqlite3_finalize(statement);
    }else{
        NSLog(@"%s", sqlite3_errmsg(database));
    }
    
	sqlite3_close(database);
    return result;
}

+ (NSArray *)getAllSection
{
	NSMutableArray *result = [NSMutableArray array];
	NSString *dbFile = [[self class] getDBFileName];
	sqlite3 *database = nil;
	sqlite3_stmt *statement = nil;
	
	if (sqlite3_open([dbFile UTF8String], &database) != SQLITE_OK) {
		sqlite3_close(database);
		return result;
	}
    
    NSString *sql = @"SELECT * FROM section";
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSDictionary *dataDictionary = [[self class] createSection:statement];
            [result addObject:[NSDictionary dictionaryWithDictionary:dataDictionary]];
        }
        sqlite3_finalize(statement);
    }else{
        NSLog(@"%s", sqlite3_errmsg(database));
    }
    
	sqlite3_close(database);
    return result;
}

+ (NSArray *)getAllParagraph
{
	NSMutableArray *result = [NSMutableArray array];
	NSString *dbFile = [[self class] getDBFileName];
	sqlite3 *database = nil;
	sqlite3_stmt *statement = nil;
	
	if (sqlite3_open([dbFile UTF8String], &database) != SQLITE_OK) {
		sqlite3_close(database);
		return result;
	}
    
    NSString *sql = @"SELECT * FROM paragraph";
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSDictionary *dataDictionary = [[self class] createParagraph:statement];
            [result addObject:[NSDictionary dictionaryWithDictionary:dataDictionary]];
        }
        sqlite3_finalize(statement);
    }else{
        NSLog(@"%s", sqlite3_errmsg(database));
    }
    
	sqlite3_close(database);
    return result;
}

+ (NSArray *)getSectionsByChapterId:(int)chapterId
{
	NSMutableArray *result = [NSMutableArray array];
	NSString *dbFile = [[self class] getDBFileName];
	sqlite3 *database = nil;
	sqlite3_stmt *statement = nil;
	
	if (sqlite3_open([dbFile UTF8String], &database) != SQLITE_OK) {
		sqlite3_close(database);
		return result;
	}
    
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM section WHERE chapter_id = %d", chapterId];
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSDictionary *dataDictionary = [[self class] createSection:statement];
            [result addObject:[NSDictionary dictionaryWithDictionary:dataDictionary]];
        }
        sqlite3_finalize(statement);
    }else{
        NSLog(@"%s", sqlite3_errmsg(database));
    }
    
	sqlite3_close(database);
    return result;
}

+ (NSArray *)getParagraphsBySectionId:(int)sectionId
{
	NSMutableArray *result = [NSMutableArray array];
	NSString *dbFile = [[self class] getDBFileName];
	sqlite3 *database = nil;
	sqlite3_stmt *statement = nil;
	
	if (sqlite3_open([dbFile UTF8String], &database) != SQLITE_OK) {
		sqlite3_close(database);
		return result;
	}
    
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM paragraph WHERE section_id = %d", sectionId];
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSDictionary *dataDictionary = [[self class] createParagraph:statement];
            [result addObject:[NSDictionary dictionaryWithDictionary:dataDictionary]];
        }
        sqlite3_finalize(statement);
    }else{
        NSLog(@"%s", sqlite3_errmsg(database));
    }
    
	sqlite3_close(database);
    return result;
}

@end
