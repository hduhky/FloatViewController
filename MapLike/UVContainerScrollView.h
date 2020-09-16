//
//  UVContainerScrollView.h
//  MapLike
//
//  Created by smb-lsp on 2020/9/16.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "ContainerView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UVContainerScrollViewDelegate <NSObject>

- (void)scrollView:(UIScrollView *)scrollView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface UVContainerScrollView : ContainerView

- (instancetype)initWithFrame:(CGRect)frame NS_DESIGNATED_INITIALIZER;

/// containerView上需要放置scrollView时，设置该对象为scrollView类的delegate，否则滑动功能会异常
@property (nonatomic, readwrite, strong) id containerScrollDelegate;

/// 需要处理点击事件回调时，需要设置该代理
@property (nonatomic, weak) id<UVContainerScrollViewDelegate> scrollViewDelegate;

/// 视图展示初始位置，默认为ContainerMoveTypeHide
@property (nonatomic, readwrite, assign) ContainerMoveType defaultPosition;

/// 向下滑动操作时是否隐藏视图，默认为NO
@property (nonatomic, readwrite, assign) BOOL shouldHide;

- (void)show;

- (void)hide;

- (void)scrollView:(UIScrollView *)scrollView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
