# LoadingHud
给控件添加小菊花，自定义菊花位置和颜色

#### 1. 效果图

![img2](https://github.com/chenhongch/LoadingHud/blob/master/img2.gif)

#### 2. 使用
可以在所有继承于UIView的控件上使用。
 导入头文件#import "UIView+LoadingHud.h"
 
```
/**
 开始loading
 */
- (void)start_Loading;

/**
 停止loading
 */
- (void)stop_Loading;


改变菊花在视图中的位置
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

```
demo演示常见的三种使用场景。




