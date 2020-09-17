//
//  UVContainerViewController.m
//  MapLike
//
//  Created by smb-lsp on 2020/9/17.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "UVContainerViewController.h"

const NSTimeInterval kDismissDelayInterval = 0.45;

@interface UVContainerViewController ()

@end

@implementation UVContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

#pragma mark - setter
- (void)setSwipeToHide:(BOOL)swipeToHide {
    _swipeToHide = swipeToHide;
    self.containerView.swipeToHide = swipeToHide;
}

- (void)setPullUpLimitedDistance:(CGFloat)pullUpLimitedDistance {
    _pullUpLimitedDistance = pullUpLimitedDistance;
    self.containerView.pullUpLimitedDistance = pullUpLimitedDistance;
}

#pragma mark - getter

#pragma mark - show and dismiss
- (void)show {
    [ROOT_VC addChildViewController:self];
    [ROOT_VC.view addSubview:self.view];
    [self didMoveToParentViewController:ROOT_VC];
    [self containerMove:ContainerMoveTypeTop animated:YES];
}

- (void)dismiss {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (void)dismissWithDelay:(NSTimeInterval)delay {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismiss];
    });
}

#pragma mark - override
- (void)shadowButtonAction {
    [self containerMove:ContainerMoveTypeHide animated:YES completion:^{
        [self dismiss];
    }];
}

- (void)changeContainerMove:(ContainerMoveType)containerMove containerY:(CGFloat)containerY animated:(BOOL)animated {
    [super changeContainerMove:containerMove containerY:containerY animated:animated];
    if (containerMove == ContainerMoveTypeHide) {
        [self dismissWithDelay:kDismissDelayInterval];
    }
}

@end
