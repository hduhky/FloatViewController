//
//  UVContainerViewHelper.h
//  MapLike
//
//  Created by smb-lsp on 2020/9/17.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ContainerTypes.h"

NS_ASSUME_NONNULL_BEGIN

@interface HeaderLabel : UIView
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *separatorLine;
@property (nonatomic, strong) UIView *grip;
@end

@interface HeaderSearch : UIView
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIView *separatorLine;
@end

@interface HeaderGrib : UIView
@property (nonatomic, strong) UIView *separatorLine;
@property (nonatomic, strong) UIImageView *separatorShadow;
@property (nonatomic, strong) UIView *grip;
@end

@interface FooterFixButton : UIView
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIView *separatorLine;
@end

@interface UVFloatContainerViewHelper : NSObject

+ (HeaderLabel *)createHeaderLabel;
+ (HeaderSearch *)createHeaderSearch;
+ (HeaderGrib *)createHeaderGrip;
+ (FooterFixButton *)createFooterFixButton;

+ (void)changeColorsHeaderView:(UIView *)headerView forStyle:(ContainerStyle)style;

@end

NS_ASSUME_NONNULL_END
