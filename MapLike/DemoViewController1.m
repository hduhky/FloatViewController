//
//  DemoViewController1.m
//  MapLike
//
//  Created by smb-lsp on 2020/9/18.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "DemoViewController1.h"
#import "UVTableViewFloatContainerController.h"
#import "BaseFloatViewController.h"

@interface DemoViewController1 ()

@end

@implementation DemoViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)showAction:(id)sender {
//    UVTableViewFloatContainerViewController *floatVC = [[UVTableViewFloatContainerViewController alloc] init];
//    floatVC.containerTop = 400;
//    floatVC.swipeToHide = YES;
//    floatVC.pullUpLimitedDistance = 0.01f;
//    [floatVC show];
    
    BaseFloatViewController *floatVC = [[BaseFloatViewController alloc] init];
    [floatVC show];
}

@end
