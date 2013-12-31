//
//  InvokedChapterViewController.m
//  NSInvocationSample
//
//  Created by saku on 2013/12/19.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import "InvokedChapterViewController.h"
#import "InvokedDAO.h"

#pragma mark - InvokedChapterViewController
@interface InvokedChapterViewController ()

@end

@implementation InvokedChapterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.items = [InvokedDAO getAllChapter];
    NSLog(@"items:%@", self.items);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    NSDictionary *data = self.items[indexPath.row];
    cell.textLabel.text = data[CHAPTER_NAME_KEY];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    NSDictionary *data = self.items[indexPath.row];
    InvokedSectionViewController *viewController = [[InvokedSectionViewController alloc] initWithStyle:UITableViewStylePlain];
    viewController.chapterId = [data[ID_KEY] intValue];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end


#pragma mark - InvokedSectionViewController
@implementation InvokedSectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.items = [InvokedDAO getSectionsByChapterId:_chapterId];
    NSLog(@"items:%@", self.items);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    NSDictionary *data = self.items[indexPath.row];
    cell.textLabel.text = data[SECTION_NAME_KEY];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    NSDictionary *data = self.items[indexPath.row];
    InvokedParagraphViewController *viewController = [[InvokedParagraphViewController alloc] initWithStyle:UITableViewStylePlain];
    viewController.sectionId = [data[ID_KEY] intValue];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end


#pragma mark - InvokedParagraphViewController
@implementation InvokedParagraphViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.items = [InvokedDAO getParagraphsBySectionId:_sectionId];
    NSLog(@"items:%@", self.items);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    NSDictionary *data = self.items[indexPath.row];
    cell.textLabel.text = data[PARAGRAPH_BODY_KEY];
    
    return cell;
}

@end
