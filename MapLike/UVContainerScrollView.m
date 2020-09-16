//
//  UVContainerScrollView.m
//  MapLike
//
//  Created by smb-lsp on 2020/9/16.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "UVContainerScrollView.h"
#import "ContainerScrollDelegate.h"

@interface UVContainerScrollView ()

@end

@implementation UVContainerScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.containerScrollDelegate = [[ContainerScrollDelegate alloc] init];
        ((ContainerScrollDelegate *)self.containerScrollDelegate).containerView = self;
    }
    return self;
}

- (void)show {
    [self containerMove:ContainerMoveTypeTop animated:YES];
}

- (void)hide {
    [self containerMove:ContainerMoveTypeHide animated:YES];
}

@end
