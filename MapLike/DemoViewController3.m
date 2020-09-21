//
//  Demo3ViewController.m
//  MapLike
//
//  Created by 黄珂耀 on 2020/9/21.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "DemoViewController3.h"

@interface DemoViewController3 () <UITableViewDataSource>

@end

@implementation DemoViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    
    self.view.backgroundColor = UIColor.greenColor;
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
