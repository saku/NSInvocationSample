//
//  SimpleChapterViewController.m
//  NSInvocationSample
//
//  Created by saku on 2013/12/19.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import "SimpleChapterViewController.h"
#import "SimpleDAO.h"

#pragma mark - SimpleChapterViewController
@interface SimpleChapterViewController ()

@end

@implementation SimpleChapterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.items = [SimpleDAO  getAllChapter];
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
    SimpleSectionViewController *viewController = [[SimpleSectionViewController alloc] initWithStyle:UITableViewStylePlain];
    viewController.chapterId = [data[ID_KEY] intValue];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end


#pragma mark - SimpleSectionViewController
@implementation SimpleSectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.items = [SimpleDAO getSectionsByChapterId:_chapterId];
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
    SimpleParagraphViewController *viewController = [[SimpleParagraphViewController alloc] initWithStyle:UITableViewStylePlain];
    viewController.sectionId = [data[ID_KEY] intValue];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end


#pragma mark - SimpleParagraphViewController
@implementation SimpleParagraphViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.items = [SimpleDAO getParagraphsBySectionId:_sectionId];
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
