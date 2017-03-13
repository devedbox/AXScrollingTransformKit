//
//  ViewController.m
//  AXScrollingTransformKit
//
//  Created by devedbox on 2017/3/12.
//  Copyright © 2017年 jiangyou. All rights reserved.
//

#import "ViewController.h"
#import "ScrollView.h"
#import "UIScrollView+Transform.h"

@interface ViewController () <AXScrollingTransformDelegate>
/// Scroll view.
@property(weak, nonatomic) IBOutlet ScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setTitle:@"NSLayoutAnchor" forState:UIControlStateNormal];
    [button setTintColor:UIColor.whiteColor];
    [button setBackgroundColor:UIColor.orangeColor];
    [_scrollView addSubview:button];
    
    [button.leadingAnchor constraintEqualToAnchor:_scrollView.leadingAnchor].active = YES;
    [button.trailingAnchor constraintEqualToAnchor:_scrollView.trailingAnchor].active = YES;
    [button.topAnchor constraintEqualToAnchor:_scrollView.imageView.bottomAnchor].active = YES;
    [button.heightAnchor constraintEqualToConstant:88.0].active = YES;
     */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AXScrollingTransformDelegate.
- (int64_t)pinModeForViewToApplyTransformOfScrollView:(UIScrollView *)scrollView {
    return 1;
}

- (CGFloat)heightForViewToApplyTransformOfScrollView:(UIScrollView *)scrollView {
    _scrollView.imageView.transform = CGAffineTransformIdentity;
    return _scrollView.imageView.frame.size.height;
}

- (void)scrollView:(UIScrollView *)scrollView transformWithScale:(CGFloat)scale translation:(CGFloat)translation {
    CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
    transform = CGAffineTransformConcat(transform, CGAffineTransformMakeTranslation(0, translation));
    
    _scrollView.imageView.transform = transform;
}
@end
