//
//  MapViewController.m
//  MapLike
//
//  Created by smb-lsp on 2020/9/15.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "MapViewController.h"
#import "TableViewController.h"

@interface MapViewController () <ContainerViewDelegate, UITableViewDelegate>

@property (nonatomic, readwrite, strong) UITableView *tableView;

@end

@implementation MapViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"地图";
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.containerAllowMiddlePosition = NO;
    self.containerTop = 80;
    self.containerBottom = 200;
    [self containerMove:ContainerMoveTypeBottom animated:NO];
    [self.containerView addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        TableViewController *tableViewController = [[TableViewController alloc] initWithStyle:UITableViewStylePlain];
        [self addChildViewController:tableViewController];
        _tableView = tableViewController.tableView;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)changeContainerMove:(ContainerMoveType)containerMove containerY:(CGFloat)containerY animated:(BOOL)animated {
    [super changeContainerMove:containerMove containerY:containerY animated:animated];
}

@end
