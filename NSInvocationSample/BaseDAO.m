//
//  BaseDAO.m
//  NSInvocationSample
//
//  Created by saku on 2013/12/18.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import "BaseDAO.h"
#import "DaoConstants.h"

#define DB_FILENAME @"sample"

@implementation BaseDAO

+ (NSArray *)getAllChapter
{
    return nil;
}

+ (NSArray *)getAllSection
{
    return nil;
}

+ (NSArray *)getAllParagraph
{
    return nil;
}

+ (NSString *) getDBFileName
{
	NSString *fileName = [[NSBundle mainBundle] pathForResource:DB_FILENAME ofType:@"sqlite"];
    
	if (![[NSFileManager defaultManager] fileExistsAtPath:fileName]) {
        [NSException raise:@"DBFileNotExistException" format:@"DB file does not exist at:%@", fileName];
    }
    
    return fileName;
}

+ (NSDictionary *)createChapter:(sqlite3_stmt *)statement
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    int index = 0;
    
	[result setObject:[NSNumber numberWithInt:sqlite3_column_int(statement, index++)] forKey:ID_KEY];
	[result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, index++)] forKey:CHAPTER_NAME_KEY];
    
    return result;
}

+ (NSDictionary *)createSection:(sqlite3_stmt *)statement
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    int index = 0;
    
	[result setObject:[NSNumber numberWithInt:sqlite3_column_int(statement, index++)] forKey:ID_KEY];
	[result setObject:[NSNumber numberWithInt:sqlite3_column_int(statement, index++)] forKey:CHAPTER_ID_KEY];
	[result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, index++)] forKey:SECTION_NAME_KEY];
    
    return result;
}

+ (NSDictionary *)createParagraph:(sqlite3_stmt *)statement
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    int index = 0;
    
	[result setObject:[NSNumber numberWithInt:sqlite3_column_int(statement, index++)] forKey:ID_KEY];
	[result setObject:[NSNumber numberWithInt:sqlite3_column_int(statement, index++)] forKey:SECTION_ID_KEY];
	[result setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, index++)] forKey:PARAGRAPH_BODY_KEY];
    
    return result;
}

@end
