//
//  UIScrollView+Hook.m
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

#import "UIScrollView+Hook.h"
#import <objc/runtime.h>

@implementation UIScrollView (Hook)
+ (void)load {
    // Changed the implementation of the scroll methods.
    Method original = class_getInstanceMethod(self, NSSelectorFromString(@"_notifyDidScroll"));
    Method hooked = class_getInstanceMethod(self, @selector(_axhook_scrollViewDidScroll));
    
    if (original != NULL) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            method_exchangeImplementations(original, hooked);
        });
    }
}

- (void)_axhook_scrollViewDidScroll {
    [self _axhook_scrollViewDidScroll];
    
    // Handle the custom components here:
    
    
}
@end
