//
//  SimpleDAO.m
//  NSInvocationSample
//
//  Created by saku on 2013/12/18.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import "InvokedDAO.h"

@implementation InvokedDAO

static NSString *chapterFactoryMethod = @"createChapter";
static NSString *sectionFactoryMethod = @"createSection";
static NSString *paragraphFactoryMethod = @"createParagraph";

+ (NSArray *)getAllChapter
{
    NSString *sql = @"SELECT * FROM chapter";
	return [[self class] fetchDataAsNSArray:sql factoryMethod:chapterFactoryMethod];
}

+ (NSArray *)getAllSection
{
    NSString *sql = @"SELECT * FROM section";
	return [[self class] fetchDataAsNSArray:sql factoryMethod:sectionFactoryMethod];
}

+ (NSArray *)getAllParagraph
{
    NSString *sql = @"SELECT * FROM paragraph";
	return [[self class] fetchDataAsNSArray:sql factoryMethod:paragraphFactoryMethod];
}

+ (NSArray *)getSectionsByChapterId:(int)chapterId
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM section WHERE chapter_id = %d", chapterId];
	return [[self class] fetchDataAsNSArray:sql factoryMethod:sectionFactoryMethod];
}

+ (NSArray *)getParagraphsBySectionId:(int)sectionId
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM paragraph WHERE section_id = %d", sectionId];
	return [[self class] fetchDataAsNSArray:sql factoryMethod:paragraphFactoryMethod];
}

/**
 * To ommit garbage code, make one method fetch dictionary data from sqlite.
 *
 * @param NSString *sql : call sql.
 * @param NSString *factoryMethod : factory method name, appropreate object.
 * @return NSArray * : dictionary data array.
 */
+ (NSArray *)fetchDataAsNSArray:(NSString *)sql factoryMethod:(NSString *)factoryMethod
{
	NSMutableArray *result = [NSMutableArray array];
	NSString *dbFile = [[self class] getDBFileName];
	sqlite3 *database = nil;
	sqlite3_stmt *statement = nil;
	
	if (sqlite3_open([dbFile UTF8String], &database) != SQLITE_OK) {
		sqlite3_close(database);
		return result;
	}
    
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
#warning change below condition "false", after you confirm crash app.
            if (true) {
                NSDictionary *dataDictionary;
                
                // invocate method by NSInvocation.
                SEL selector = NSSelectorFromString([NSString stringWithFormat:@"%@:", factoryMethod]);
                NSMethodSignature* signature = [[self class] methodSignatureForSelector:selector];
                NSInvocation* invocation = [ NSInvocation invocationWithMethodSignature:signature];
                [invocation setSelector:selector];
                [invocation setTarget:[self class]];
                [invocation setArgument:&statement atIndex:2];
                [invocation invoke];
                [invocation getReturnValue:&dataDictionary];
                
                [result addObject:[NSDictionary dictionaryWithDictionary:dataDictionary]];
            } else {
                CFTypeRef data;
                
                // invocate method by NSInvocation.
                SEL selector = NSSelectorFromString([NSString stringWithFormat:@"%@:", factoryMethod]);
                NSMethodSignature* signature = [[self class] methodSignatureForSelector:selector];
                NSInvocation* invocation = [ NSInvocation invocationWithMethodSignature:signature];
                [invocation setSelector:selector];
                [invocation setTarget:[self class]];
                [invocation setArgument:&statement atIndex:2];
                [invocation invoke];
                [invocation getReturnValue:&data];
                
                // When out of this method scope, then released data. So, use CFRetain and go well.
                // http://stackoverflow.com/questions/7078109/why-does-nsinvocation-getreturnvalue-loose-object/11569236#11569236
                if (data) CFRetain(data);
                NSDictionary *dataDictionary = (__bridge_transfer NSDictionary *)data;
                
                [result addObject:[NSDictionary dictionaryWithDictionary:dataDictionary]];
            }
        }
        sqlite3_finalize(statement);
    }else{
        NSLog(@"%s", sqlite3_errmsg(database));
    }
    
	sqlite3_close(database);
    return result;
}

@end
