//
//  MineViewController.m
//  MapLike
//
//  Created by smb-lsp on 2020/9/16.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "MineViewController.h"
#import "UVContainerScrollView.h"

@interface MineViewController () <UVContainerScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, readwrite, strong) UIButton *button;

@property (nonatomic, readwrite, strong) UVContainerScrollView *containerView;

@end

@implementation MineViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"我的";
        self.view.backgroundColor = [UIColor whiteColor];
        self.button = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.button setTitle:@"Click" forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        self.button.frame = CGRectMake(50, 100, 100, 60);
        [self.view addSubview:self.button];
        [self.view addSubview:self.containerView];
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.delegate = self.containerView.containerScrollDelegate;
        tableView.dataSource = self;
        [self.containerView addSubview:tableView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)click:(UIButton *)button {
    if (self.containerView.containerPosition == ContainerMoveTypeTop) {
        [self.containerView hide];
    } else {
        [self.containerView show];
    }
}

#pragma mark - tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
    cell.textLabel.text = [NSString stringWithFormat:@"No:%@", @(indexPath.row)];
    return cell;
}

#pragma mark - tableView delegate
- (void)scrollView:(UIScrollView *)scrollView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"scrollView didSelectItemAtIndexPath: %@", @(indexPath.row));
}

- (UVContainerScrollView *)containerView {
    if (!_containerView) {
        _containerView = [[UVContainerScrollView alloc] initWithFrame:self.view.bounds];
        _containerView.scrollViewDelegate = self;
        _containerView.shouldHide = YES;
    }
    return _containerView;
}

@end
