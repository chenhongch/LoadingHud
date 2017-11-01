

//
//  UIView+LoadingHud.m
//  LoadingHud
//
//  Created by 陈红 on 2017/10/31.
//  Copyright © 2017年 陈红:ch_email@126.cm. All rights reserved.
//


#import "UIView+LoadingHud.h"
#import "UIView+Category.h"
#import <objc/runtime.h>

static void *indicatorViewKey = &indicatorViewKey;
static void *colorKey = &colorKey;
static void *topKey = &topKey;
static void *leftKey = &leftKey;
static void *rightKey = &rightKey;
static void *bottomKey = &bottomKey;

@interface UIView ()

@property (nonatomic,retain)UIActivityIndicatorView *indicatorView;

@end

@implementation UIView (LoadingHud)

- (UIActivityIndicatorView *)indicatorView{
    return objc_getAssociatedObject(self, &indicatorViewKey);
}
- (void)setIndicatorView:(UIActivityIndicatorView *)indicatorView{
    objc_setAssociatedObject(self, &indicatorViewKey, indicatorView, OBJC_ASSOCIATION_RETAIN);
}

- (UIColor *)lh_color{
    return objc_getAssociatedObject(self, &colorKey);
}
- (void)setLh_color:(UIColor *)lh_color{
    objc_setAssociatedObject(self, &colorKey, lh_color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)lh_top{
    return objc_getAssociatedObject(self, &topKey);
}
- (void)setLh_top:(id)lh_top{
    objc_setAssociatedObject(self, &topKey, lh_top, OBJC_ASSOCIATION_ASSIGN) ;
}

- (id)lh_left{
    return objc_getAssociatedObject(self, &leftKey);
}
- (void)setLh_left:(id)lh_left{
    CGFloat left = [lh_left floatValue];
    self.indicatorView.left = left;
    objc_setAssociatedObject(self, &topKey, lh_left, OBJC_ASSOCIATION_ASSIGN) ;
}

- (id)lh_right{
    return objc_getAssociatedObject(self, &rightKey);
}
- (void)setLh_right:(id)lh_right{
    CGFloat right = [lh_right floatValue];
    self.indicatorView.right = right;
    objc_setAssociatedObject(self, &rightKey, lh_right, OBJC_ASSOCIATION_ASSIGN) ;
}

- (id)lh_bottom{
    return objc_getAssociatedObject(self, &bottomKey);
}
- (void)setLh_bottom:(id)lh_bottom{
    objc_setAssociatedObject(self, &bottomKey, lh_bottom, OBJC_ASSOCIATION_ASSIGN) ;
}


- (void)start_Loading{
    [self initindicatorView];
}

- (void)stop_Loading{
    [self removoLoading];
}

- (void)initindicatorView{

    if (!self.indicatorView) {
        self.indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        [self.indicatorView startAnimating];
        [self addSubview: self.indicatorView];
        self.indicatorView.color = [UIColor grayColor];
        self.indicatorView.userInteractionEnabled = NO;
        self.indicatorView.left = self.frame.size.width/2 - 25;
        self.indicatorView.top = self.frame.size.height/2 - 25;
        //***必须要加上此句代码 不然菊花不会显示 需要重复调用
        self.clipsToBounds = YES;
    }
    
}

- (void)removoLoading{
    if (self.indicatorView) {
        [self.indicatorView removeFromSuperview];
        self.indicatorView = nil;
    }
}










@end
