//
//  BaseFloatViewController.m
//  MapLike
//
//  Created by 黄珂耀 on 2020/9/21.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "BaseFloatViewController.h"
#import "UVFloatContainerViewHelper.h"

static const NSTimeInterval kDismissDelayInterval = 0.45;

@interface BaseFloatViewController () <KYContainerControllerDelegate>

@end

@implementation BaseFloatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KYContainerLayout *layout = [[KYContainerLayout alloc] init];
    layout.startPosition = KYContainerMoveTypeHide;
    layout.backgroundShadowShow = YES;
    layout.positions = [KYContainerPosition positionWithTop:200 middle:0 bottom:0];
    layout.swipeToHide = YES;
    
    KYContainerController *container = [[KYContainerController alloc] initWithViewController:self layout:layout];
    container.view.cornerRadius = 15;
    [container.view addShadow];
    
    HeaderLabel *header = [UVFloatContainerViewHelper createHeaderLabel];
    [UVFloatContainerViewHelper changeColorsHeaderView:header forStyle:ContainerStyleDefault];
    [container addHeaderView:header];
    
    container.shadowButton.userInteractionEnabled = YES;
    container.delegate = self;
    self.container = container;
}

#pragma mark - show and dismiss
- (void)show {
    [UIApplication.sharedApplication.keyWindow.rootViewController addChildViewController:self];
    [UIApplication.sharedApplication.keyWindow.rootViewController.view addSubview:self.view];
    [self.container moveWithType:KYContainerMoveTypeTop];
}

- (void)dismiss {
    [self.container moveWithType:KYContainerMoveTypeHide completion:^{
        [self remove];
    }];
}

- (void)dismissWithDelay:(NSTimeInterval)delay {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self remove];
    });
}

- (void)remove {
    self.container = nil;
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

#pragma mark - KYContainerControllerDelegate
- (void)containerControllerShadowClickWithContainerController:(KYContainerController *)containerController {
    [self dismiss];
}

- (void)containerControllerMoveWithContainerController:(KYContainerController *)containerController position:(CGFloat)position type:(KYContainerMoveType)type animation:(BOOL)animation {
    if (type == KYContainerMoveTypeHide) {
        [self dismissWithDelay:kDismissDelayInterval];
    }
}

@end
