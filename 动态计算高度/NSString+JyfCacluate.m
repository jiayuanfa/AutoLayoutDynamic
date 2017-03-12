//
//  NSString+JyfCacluate.m
//  动态计算高度
//
//  Created by JiaYuanFa on 2017/3/12.
//  Copyright © 2017年 JiaYuanFa. All rights reserved.
//

#import "NSString+JyfCacluate.h"
#import <UIKit/UIKit.h>

@implementation NSString (JyfCacluate)

#pragma mark -- 计算宽窄的函数
-(float)autoCalculateWidthOrHeight:(float)height
                             width:(float)width
                          fontsize:(float)fontsize
                           content:(NSString*)content
{
    //计算出rect
    CGRect rect = [content boundingRectWithSize:CGSizeMake(width, height)
                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]} context:nil];
    
    //判断计算的是宽还是高
    if (height == MAXFLOAT) {
        return rect.size.height;
    }
    else
        return rect.size.width;
}

@end
