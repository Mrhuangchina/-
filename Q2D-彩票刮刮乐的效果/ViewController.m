//
//  ViewController.m
//  Q2D-彩票刮刮乐的效果
//
//  Created by MrHuang on 18/9/3.
//  Copyright © 2018年 Mrhuang. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageWithColor.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ImageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.ImageV.userInteractionEnabled = YES;
    // 给ImageV设置一张带灰色的图片
    self.ImageV.image = [UIImage imageWithColor:[UIColor lightGrayColor]];
    
    // 给图片添加手势
    UIPanGestureRecognizer * panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGes:)];
    [self.ImageV addGestureRecognizer:panGes];
    
    
}

-(void)panGes:(UIPanGestureRecognizer *)panGes{

    
         // 拿到当前手势的点位
    CGPoint currentP = [panGes locationInView:self.ImageV];
         // 确定擦除区域大小
         CGFloat WH = 20;
    CGFloat x = currentP.x - WH * 0.5;
    CGFloat y = currentP.y - WH * 0.5;
    CGRect rect = CGRectMake(x, y, WH, WH);
    
    // 开启图形上下文
    UIGraphicsBeginImageContextWithOptions(self.ImageV.bounds.size, NO, 0);
    // 把图片渲染到当前上下文中
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.ImageV.layer renderInContext:ctx];
    // 擦除上下文中的指定区域
    CGContextClearRect(ctx, rect);
    
    // 从上下文中获取新生成的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭当前上下文
    UIGraphicsEndImageContext();
    
    // 将最新图片显示
    self.ImageV.image = newImage;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
