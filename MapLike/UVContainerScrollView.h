//
//  UVContainerScrollView.h
//  MapLike
//
//  Created by smb-lsp on 2020/9/16.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "ContainerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UVContainerScrollView : ContainerView

@property (nonatomic, readwrite, strong) id containerScrollDelegate;

- (void)show;

- (void)hide;

@end

NS_ASSUME_NONNULL_END
