//
//  MapLikeViewController.m
//  MapLike
//
//  Created by smb-lsp on 2020/9/15.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "MapLikeViewController.h"
#import "SheetView.h"

@interface MapLikeViewController ()

@end

@implementation MapLikeViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"苹果地图";
        self.view.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SheetView *sheetView = [[SheetView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:sheetView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
