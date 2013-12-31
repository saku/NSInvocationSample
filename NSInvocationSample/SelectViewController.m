//
//  SelectViewController.m
//  BluetoothLESample
//
//  Created by Yoichiro Sakurai on 2013/11/01.
//  Copyright (c) 2013 Yoichiro Sakurai. All rights reserved.
//

#import "SelectViewController.h"

@interface SelectViewController ()

@property NSArray *samples;

@end

@implementation SelectViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"NSInvocation Sample";
        _samples = @[
                     @"SimpleInvoke",
                     @"ClassMethodInvoke",
                     @"PassParams",
                     @"GetReturnValue",
                     @"SimpleChapter",
                     @"InvokedChapter",
                     ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _samples.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    // Configure the cell...
    cell.textLabel.text = _samples[indexPath.row];

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *className = [NSString stringWithFormat:@"%@ViewController", _samples[indexPath.row]];
    UIViewController *viewController = [[NSClassFromString(className) alloc] init];
    viewController.title = _samples[indexPath.row];

    [self.navigationController pushViewController:viewController animated:YES];
}

@end
