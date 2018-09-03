//
//  UIImage+ImageWithColor.h
//  Q2D-彩票刮刮乐的效果
//
//  Created by MrHuang on 18/9/3.
//  Copyright © 2018年 Mrhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageWithColor)


// 根据颜色生成一张1*1尺寸大小的图片
+(UIImage *)imageWithColor:(UIColor *)color;

@end
