//
//  UIScrollView+Hook.h
//  AXScrollingTransformKit
//
//  Created by devedbox on 2017/3/12.
//  Copyright © 2017年 jiangyou. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import <UIKit/UIScrollView.h>
/// Pin mode of the view to be applied with transform.
typedef NS_ENUM(int64_t, AXScrollingTransformPinMode) {
    /// Not to pin to any edge.
    AXScrollingTransformPinNone,
    /// Same as above.
    AXScrollingTransformPinToCenter = AXScrollingTransformPinNone,
    /// Pin to top edge.
    AXScrollingTransformPinToTopEdge,
    /// Pin to bottom edge.
    AXScrollingTransformPinToBottomEdge
};
/// Protocol for transforms of the subview on scroll view.
@protocol AXScrollingTransformDelegate <NSObject>
@required
/// Get the height for the view to apply transform with.
/// @discussion This will be the original value without any transform applying on the view.
///
/// @param scrollView scroll view to affect transform.
/// @return height of view to applying transform.
- (CGFloat)heightForViewToApplyTransformOfScrollView:(UIScrollView *)scrollView;
/// Decide to transform the view with pin to top or bottom or nothing.
///
/// @param scrollView scroll view to affect transform.
/// @return pin mode defined in `AXScrollingTransformPinMode`.
- (int64_t)pinModeForViewToApplyTransformOfScrollView:(UIScrollView *)scrollView;
@optional
/// Do custom transform with a scale factor and a translation value for the vertical direction.
///
/// @param scrollView scroll view to affect transform.
/// @param scale scale factor to make scale transform.
/// @param translation translation for the vertical direction.
///
- (void)scrollView:(UIScrollView *)scrollView transformWithScale:(CGFloat)scale translation:(CGFloat)translation;
@end

@interface UIScrollView (Transform)
@end
