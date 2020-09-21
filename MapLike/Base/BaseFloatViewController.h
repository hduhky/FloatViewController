//
//  BaseFloatViewController.h
//  MapLike
//
//  Created by 黄珂耀 on 2020/9/21.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYContainerController.h"

@interface BaseFloatViewController : UIViewController

@property (nonatomic, readwrite, strong) KYContainerController *container;

- (void)show;

- (void)dismiss;

@end

