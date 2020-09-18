//
//  UVTableViewController.m
//  MapLike
//
//  Created by smb-lsp on 2020/9/17.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "UVTableViewFloatContainerController.h"

@interface UVTableViewFloatContainerViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, readwrite, strong) UITableView *tableView;

@end

@implementation UVTableViewFloatContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HeaderLabel *header = [UVFloatContainerViewHelper createHeaderLabel];
    [UVFloatContainerViewHelper changeColorsHeaderView:header forStyle:self.containerStyle];
    self.headerView = header;
    
    [self.containerView addSubview:self.tableView];
}

#pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
    cell.textLabel.text = [NSString stringWithFormat:@"No:%@", @(indexPath.row)];
    return cell;
}

#pragma mark - delegate

#pragma mark - getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 56, 0);
    }
    return _tableView;
}

@end