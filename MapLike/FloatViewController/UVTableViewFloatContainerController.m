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

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HeaderLabel *header = [UVFloatContainerViewHelper createHeaderLabel];
    [UVFloatContainerViewHelper changeColorsHeaderView:header forStyle:self.containerStyle];
    self.headerView = header;
    
    FooterFixButton *footerView = [self createFooterFixView];
    [self.view addSubview:footerView];
    
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
- (void)changeContainerMove:(ContainerMoveType)containerMove containerY:(CGFloat)containerY animated:(BOOL)animated {
    [super changeContainerMove:containerMove containerY:containerY animated:animated];
}
#pragma mark - getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        if (self.footerFixView) {
            UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0, 0, CGRectGetHeight(self.footerFixView.frame), 0);
            _tableView.contentInset = edgeInsets;
        }
    }
    return _tableView;
}

- (FooterFixButton *)createFooterFixView {
    FooterFixButton *footer = [UVFloatContainerViewHelper createFooterFixButton];
    footer.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) - CGRectGetHeight(footer.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(footer.frame));
    self.footerFixView = footer;
    return footer;
}
@end
