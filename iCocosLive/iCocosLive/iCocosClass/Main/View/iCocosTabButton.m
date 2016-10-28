//
//  HGTabButton.m
//  HiGo
//
//  Created by Think_lion on 15/7/25.
//  Copyright (c) 2015年 Think_lion. All rights reserved.
//

#import "iCocosTabButton.h"

@implementation iCocosTabButton

-(void)setHighlighted:(BOOL)highlighted{}


-(void)setItem:(UITabBarItem *)item
{
    _item=item;
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setTitle:item.title forState:UIControlStateSelected];
    
}
    
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 内部图标居中
        self.imageView.contentMode = UIViewContentModeTop;
        // 文字对齐
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 文字颜色
        [self setTitleColor:[UIColor colorWithHexString:@"#b3b3b3"] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithHexString:@"#9455F2"] forState:UIControlStateSelected];
        // 高亮的时候不需要调整内部的图片为灰色
        self.adjustsImageWhenHighlighted = NO;
        
        //        self.contentMode = UIViewContentModeCenter;
        
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return self;
}

/**
 *  设置内部图标的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 5;
    CGFloat imageX = (iCocosScreenW / 4 - 40) / 2;
    CGFloat imageH = 25;
    CGFloat imageW = 40;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

/**
 *  设置内部文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleW = iCocosScreenW / 4;
    CGFloat titleH = 49 - 30;
    CGFloat titleY = 30;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

@end
