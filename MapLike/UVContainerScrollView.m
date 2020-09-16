//
//  UVContainerScrollView.m
//  MapLike
//
//  Created by smb-lsp on 2020/9/16.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "UVContainerScrollView.h"
#import "UVContainerScrollDelegate.h"

@interface UVContainerScrollView () <UITableViewDelegate, UICollectionViewDelegate>

@end

@implementation UVContainerScrollView

#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.containerScrollDelegate = [[UVContainerScrollDelegate alloc] init];
        ((UVContainerScrollDelegate *)self.containerScrollDelegate).containerView = self;
        self.defaultPosition = ContainerMoveTypeHide;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (void)setDefaultPosition:(ContainerMoveType)defaultPosition {
    _defaultPosition = defaultPosition;
    [self containerMove:defaultPosition animated:NO];
}

#pragma mark - show and hide
- (void)show {
    [self containerMove:ContainerMoveTypeTop animated:YES];
}

- (void)hide {
    [self containerMove:ContainerMoveTypeHide animated:YES];
}

- (void)scrollView:(UIScrollView *)scrollView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.scrollViewDelegate && [self.scrollViewDelegate respondsToSelector:@selector(scrollView:didSelectItemAtIndexPath:)]) {
        [self.scrollViewDelegate scrollView:scrollView didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark - override
/// Container Move
- (void)containerMoveForVelocityInView:(CGFloat)velocityInViewY {
    ContainerMoveType moveType;

    if (self.containerAllowMiddlePosition) {
        if (self.transform.ty < self.containerMiddle) {
            if (velocityInViewY < 0) {
                moveType = ContainerMoveTypeTop;
            } else {
                moveType = (2500 < velocityInViewY) ? ContainerMoveTypeBottom : ContainerMoveTypeMiddle;
            }
        } else {
            if (velocityInViewY < 0) {
                moveType = (velocityInViewY < (-2000)) ? ContainerMoveTypeTop : ContainerMoveTypeMiddle;
            } else {
                moveType = ContainerMoveTypeBottom;
            }
        }
    } else {
        if (self.transform.ty < self.containerTop) {
            moveType = (750 < velocityInViewY) ? ContainerMoveTypeBottom : ContainerMoveTypeTop;
        } else {
            moveType = (velocityInViewY < 0) ? ContainerMoveTypeTop : ContainerMoveTypeBottom;
        }
    }
    if (self.shouldHide && moveType == ContainerMoveTypeBottom) {
        moveType = ContainerMoveTypeHide;
    }
    [self containerMove:moveType];
}

@end
