//
//  DemoViewController2.m
//  MapLike
//
//  Created by smb-lsp on 2020/9/18.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "DemoViewController2.h"
#import "BaseFloatTableViewController.h"

@interface DemoViewController2 ()

@property (nonatomic, readwrite, strong) BaseFloatTableViewController *floatVC;

@end

@implementation DemoViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.floatVC.view.hidden = YES;
    [self.view addSubview:self.floatVC.container.view];
    [self.floatVC.container moveWithType:KYContainerMoveTypeTop];
}

- (BaseFloatTableViewController *)floatVC {
    if (!_floatVC) {
        _floatVC = [[BaseFloatTableViewController alloc] init];
    }
    return _floatVC;
}

@end
