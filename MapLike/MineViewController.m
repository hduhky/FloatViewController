//
//  MineViewController.m
//  MapLike
//
//  Created by smb-lsp on 2020/9/16.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "MineViewController.h"
#import "UVTableViewFloatContainerController.h"

const CGFloat kPullUpLimitDistance = 30.0;

@interface MineViewController ()

@property (nonatomic, readwrite, strong) UIButton *button;

@property (nonatomic, readwrite, strong) UVTableViewFloatContainerViewController *floatViewController;

@end

@implementation MineViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"我的";
        self.view.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.button];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)click:(UIButton *)button {
    [self.view addSubview:self.floatViewController.containerView];
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:@"Click" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        _button.frame = CGRectMake(50, 100, 100, 60);
    }
    return _button;
}

- (UVTableViewFloatContainerViewController *)floatViewController {
    if (!_floatViewController) {
        _floatViewController = [[UVTableViewFloatContainerViewController alloc] init];
        _floatViewController.containerTop = 300;
        _floatViewController.shouldHideView = YES;
    }
    return _floatViewController;
}

@end
