//
//  UVContainerViewController.h
//  MapLike
//
//  Created by smb-lsp on 2020/9/17.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "ContainerViewController.h"
#import "UVFloatContainerViewHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface UVFloatContainerViewController : ContainerViewController

@property (nonatomic, readwrite, assign) BOOL swipeToHide;

@property (nonatomic, readwrite, assign) BOOL shouldHideView;

@property (nonatomic, readwrite, assign) CGFloat pullUpLimitedDistance;

@property (nonatomic, readwrite, strong) UIView *footerFixView;

- (void)show;

- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
