//
//  SheetView.m
//  MapLike
//
//  Created by smb-lsp on 2020/9/15.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "SheetView.h"
#import <Masonry.h>

typedef enum : NSUInteger {
    SheetViewStatusTop,
    SheetViewStatusMoving,
    SheetViewStatusBottom,
} SheetViewStatus;

const CGFloat kContentViewMaxHeight = 600;
const CGFloat kContentViewMinHeight = 200;

@interface SheetView () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property (nonatomic, readwrite, strong) UIView *backView;

@property (nonatomic, readwrite, strong) UIView *contentView;

@property (nonatomic, readwrite, strong) UITableView *tableView;

@property (nonatomic, readwrite, strong) UIPanGestureRecognizer *panGesture;

@property (nonatomic, readwrite, assign) CGPoint panGestureStartPoint;

@property (nonatomic, readwrite, strong) UISwipeGestureRecognizer *swipeUpGesture;

@property (nonatomic, readwrite, strong) UISwipeGestureRecognizer *swipeDownGesture;

@property (nonatomic, readwrite, assign) SheetViewStatus status;

@end

@implementation SheetView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            self.backView = [UIView new];
            self.backView.backgroundColor = [UIColor blackColor];
            self.backView.alpha = 0.3;
            self.backView;
        })];
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self);
        }];

        [self addSubview:({
            self.contentView = [UIView new];
            self.contentView.backgroundColor = [UIColor greenColor];
            self.contentView;
        })];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.mas_equalTo(kContentViewMaxHeight);
        }];

        [self.contentView addSubview:({
            self.tableView = [UITableView new];
            self.tableView.delegate = self;
            self.tableView.dataSource = self;
            self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panWithGesture:)];
            [self.tableView addGestureRecognizer:self.panGesture];
            self.swipeUpGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeWithGesture:)];
            self.swipeUpGesture.direction = UISwipeGestureRecognizerDirectionUp;
            [self.tableView addGestureRecognizer:self.swipeUpGesture];
            self.swipeDownGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeWithGesture:)];
            self.swipeDownGesture.direction = UISwipeGestureRecognizerDirectionDown;
            [self.tableView addGestureRecognizer:self.swipeDownGesture];
            self.tableView;
        })];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(20);
            make.left.right.bottom.equalTo(self.contentView);
        }];

        self.status = SheetViewStatusTop;
    }
    return self;
}

- (void)setStatus:(SheetViewStatus)status {
    _status = status;
    if (status != SheetViewStatusTop) {
        self.tableView.scrollEnabled = NO;
        self.panGesture.enabled = YES;
        self.swipeUpGesture.enabled = YES;
        self.swipeDownGesture.enabled = YES;
    } else {
        self.tableView.scrollEnabled = YES;
        self.panGesture.enabled = NO;
        self.swipeUpGesture.enabled = NO;
        self.swipeDownGesture.enabled = NO;
    }
}

- (void)updateContentViewFrameWithPoint:(CGPoint)point {
    if (self.panGestureStartPoint.x == 0 && self.panGestureStartPoint.y == 0) {
        self.panGestureStartPoint = point;
    }
    CGFloat offsetY = point.y - self.panGestureStartPoint.y;
    NSLog(@"offsetY %@", @(offsetY));
    CGFloat contentViewHeight = CGRectGetHeight(self.contentView.frame) - offsetY;
    if (contentViewHeight > kContentViewMaxHeight || contentViewHeight < kContentViewMinHeight) {
        self.panGestureStartPoint = CGPointZero;
        return;
    }
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(contentViewHeight);
    }];
}

- (void)animateEndContentViewFrameWithPoint:(CGPoint)point {
    self.panGestureStartPoint = CGPointZero;
    CGFloat contentViewHeight = CGRectGetHeight(self.contentView.frame) - point.y;
    CGFloat middleHeight = (kContentViewMaxHeight + kContentViewMinHeight) / 2.0;
    if (contentViewHeight > middleHeight) {
        [self animateToMaxHeight];
        self.status = SheetViewStatusTop;
    } else {
        [self animateToMinHeight];
        self.status = SheetViewStatusBottom;
    }
}

- (void)animateToMaxHeight {
    [UIView animateWithDuration:0.2 animations:^{
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(kContentViewMaxHeight);
        }];
        [self.contentView.superview layoutIfNeeded];
    }];
}

- (void)animateToMinHeight {
    [UIView animateWithDuration:0.2 animations:^{
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(kContentViewMinHeight);
        }];
        [self.contentView.superview layoutIfNeeded];
    }];
}

#pragma mark - gesture delegate
- (void)panWithGesture:(UIPanGestureRecognizer *)panGesture {
    CGPoint point = [panGesture locationInView:panGesture.view];
    if (panGesture.state == UIGestureRecognizerStateChanged) {
        [self updateContentViewFrameWithPoint:point];
    } else if (panGesture.state == UIGestureRecognizerStateEnded) {
        [self animateEndContentViewFrameWithPoint:point];
    }
}

- (void)swipeWithGesture:(UISwipeGestureRecognizer *)swipeGesture {
    if (swipeGesture.direction == UISwipeGestureRecognizerDirectionUp) {
        [self animateToMaxHeight];
        self.status = SheetViewStatusTop;
    } else if (swipeGesture.direction == UISwipeGestureRecognizerDirectionDown) {
        [self animateToMinHeight];
        self.status = SheetViewStatusBottom;
    }
}

#pragma mark - tableView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point = scrollView.contentOffset;
    NSLog(@"tableView y:%f", point.y);
    if (point.y < 0) {
        self.status = SheetViewStatusMoving;
    }
}

#pragma mark - tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"No:%@", @(indexPath.row)];
    return cell;
}

@end
