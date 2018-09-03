//
//  UIImage+ImageWithColor.m
//  Q2D-彩票刮刮乐的效果
//
//  Created by MrHuang on 18/9/3.
//  Copyright © 2018年 Mrhuang. All rights reserved.
//

#import "UIImage+ImageWithColor.h"

@implementation UIImage (ImageWithColor)


+(UIImage *)imageWithColor:(UIColor *)color{

    // 确定生成区域的大小
    CGRect rect = CGRectMake(0, 0, 1.0f, 1.0f);
    
    // 开启渲染位图上下文的大小
    UIGraphicsBeginImageContext(rect.size);
    // 获取当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //使用color 填充上下文
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    //渲染上下文
    CGContextFillRect(ctx, rect);
    // 获取新生成的图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;

}

@end
