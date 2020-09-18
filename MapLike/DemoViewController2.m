//
//  DemoViewController2.m
//  MapLike
//
//  Created by smb-lsp on 2020/9/18.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "DemoViewController2.h"
#import "UVTableViewFloatContainerController.h"

@interface DemoViewController2 ()

@property (nonatomic, readwrite, strong) UVTableViewFloatContainerViewController *floatVC;

@end

@implementation DemoViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.floatVC.containerView];
}

- (UVTableViewFloatContainerViewController *)floatVC {
    if (!_floatVC) {
        _floatVC = [[UVTableViewFloatContainerViewController alloc] init];
        _floatVC.containerTop = 300;
        _floatVC.shouldHideView = YES;
    }
    return _floatVC;
}

@end
