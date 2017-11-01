//
//  UIView+LoadingHud.h
//  LoadingHud
//
//  Created by 陈红 on 2017/10/31.
//  Copyright © 2017年 陈红:ch_email@126.cm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LoadingHud)

//********************************默认(菊花位于视图中心，菊花颜色为灰色)
/**
 开始loading
 */
- (void)start_Loading;

/**
 停止loading
 */
- (void)stop_Loading;



//********************************自定义

/**
 菊花颜色
 */
@property (nonatomic,retain)UIColor *lh_color;

/**
 菊花距离视图左边的边距
 */
@property (nonatomic,assign)id lh_left;
/**
 菊花距离视图右边的边距
 */
@property (nonatomic,assign)id lh_right;
/**
 菊花距离视图顶部的边距
 */
@property (nonatomic,assign)id lh_top;
/**
 菊花距离视图底部的边距
 */
@property (nonatomic,assign)id lh_bottom;
/**
 菊花
 */
@property (nonatomic,retain)UIActivityIndicatorView *indicatorView;


@end
