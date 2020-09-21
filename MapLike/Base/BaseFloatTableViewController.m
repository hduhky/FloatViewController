//
//  BaseFloatTableViewController.m
//  MapLike
//
//  Created by 黄珂耀 on 2020/9/21.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "BaseFloatTableViewController.h"

@interface BaseFloatTableViewController () <UITableViewDataSource>

@end

@implementation BaseFloatTableViewController

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.dataSource = self;
    
    [self.container addScrollView:tableView];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.container remove];
    self.container = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"No:%@", @(indexPath.row)];
    return cell;
}

@end
