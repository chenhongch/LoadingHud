//
//  ViewController.m
//  LoadingHud
//
//  Created by 陈红 on 2017/10/31.
//  Copyright © 2017年 陈红:ch_email@126.cm. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LoadingHud.h"
#import "UIView+Category.h"
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


@interface ViewController ()
@property (nonatomic,retain)UILabel *lab;
@property (nonatomic,retain)UIImageView *img;
@property (nonatomic,retain)UIView *bgview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //****************** 1. UILable使用演示
    
    NSString *str = @"正在加载中...";
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(30, 200, self.view.width - 60, 40)];
    lab.textAlignment = 1;
    lab.font = [UIFont systemFontOfSize:15];
    lab.text = str;
    lab.layer.cornerRadius = 5;
    lab.layer.masksToBounds = YES;
    lab.backgroundColor = RGB(252, 161, 103);
    self.lab = lab;
    [self.view addSubview:lab];

    [self.lab start_Loading];
    CGSize size  = [str sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]}];
    self.lab.lh_right = @(self.lab.width/2 - size.width/2);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.lab stop_Loading];
        self.lab.text = @"+ 点击关注主播";
        self.lab.textColor = [UIColor whiteColor];
    });

     //****************** 2. UIImageView使用演示
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(lab.frame)+20, self.view.width, 200)];
    imgView.backgroundColor = RGB(240, 240, 240);
    self.img = imgView;
    [self.view addSubview:imgView];
    [self.img start_Loading];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [imgView stop_Loading];
        imgView.image = [UIImage imageNamed:@"timg.jpeg"];
    });
    
     //****************** 3. UIView使用演示
    UIView *lab1 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imgView.frame)+20, self.view.width, 200)];
    lab1.backgroundColor = RGB(248, 248, 248);
    self.bgview = lab1;
    [self.view addSubview:lab1];
    [self.bgview start_Loading];
    
    
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSString *str = @"正在加载中...";
    self.lab.text = str;
    [self.lab start_Loading];
    CGSize size  = [str sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]}];
        self.lab.lh_right = @(self.lab.width/2 - size.width/2);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       [self.lab stop_Loading];
        self.lab.text = @"+ 点击关注主播";
        self.lab.textColor = [UIColor whiteColor];
    });
    
    [self.img start_Loading];
    self.img.image = nil;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.img stop_Loading];
        self.img.image = [UIImage imageNamed:@"timg.jpeg"];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
