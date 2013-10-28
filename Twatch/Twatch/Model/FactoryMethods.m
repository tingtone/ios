//
//  FactoryMethods.m
//  Twatch
//
//  Created by yixiaoluo on 13-10-13.
//  Copyright (c) 2013年 龚涛. All rights reserved.
//

#import "FactoryMethods.h"

CGRect CGRectChangeWidth(CGRect frame, CGFloat width)
{
    frame.size.width = width;
    return frame;
}

CGRect CGRectChangeHeight(CGRect frame, CGFloat height)
{
    frame.size.height = height;
    return frame;
}

CGRect CGRectChangeX(CGRect frame, CGFloat x)
{
    frame.origin.x = x;
    return frame;
}

CGRect CGRectChangeY(CGRect frame, CGFloat y)
{
    frame.origin.y = y;
    return frame;
}

CGRect CGRectChangeOrigin(CGRect frame, CGFloat x, CGFloat y)
{
    frame.origin.x = x;
    frame.origin.y = y;
    return frame;
}

CGRect CGRectChangeSize(CGRect frame, CGFloat width, CGFloat height)
{
    frame.size.width = width;
    frame.size.height = height;
    return frame;
}


@implementation FactoryMethods

+ (UIButton *)buttonWWithNormalImage:(NSString *)normal hiliteImage:(NSString *)hilite target:(id)target selector:(SEL)sel
{
    UIImage *img = [UIImage imageNamed:normal];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, img.size.width, img.size.height)];
    [button setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hilite] forState:UIControlStateHighlighted];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)buttonWWithTitle:(NSString *)title normalBg:(NSString *)bg hiliteBg:(NSString *)hbg target:(id)target selector:(SEL)sel;
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:bg] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:hbg] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)buttonWWithTitle:(NSString *)title normalColor:(UIColor *)normal hiliteColor:(UIColor *)hilite target:(id)target selector:(SEL)sel
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:normal forState:UIControlStateNormal];
    
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitleColor:hilite forState:UIControlStateHighlighted];
    
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
