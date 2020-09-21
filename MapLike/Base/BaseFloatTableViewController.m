//
//  BaseFloatTableViewController.m
//  MapLike
//
//  Created by 黄珂耀 on 2020/9/21.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "BaseFloatTableViewController.h"

@interface BaseFloatTableViewController ()

@end

@implementation BaseFloatTableViewController

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView = tableView;
    [self.container addScrollView:tableView];
    self.container.layout.swipeToHide = NO;
    self.container.shadowButton.userInteractionEnabled = NO;
    [self.container moveWithType:KYContainerMoveTypeTop];
}


@end
