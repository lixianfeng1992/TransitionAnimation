//
//  MyCell.m
//  Demo2_自定义集合项和布局
//
//  Created by tarena on 15/10/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyCell.h"

@interface MyCell ()

@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)UILabel *textLabel;

@end



@implementation MyCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建背景视图
        UIImageView *bgImageView = [[UIImageView alloc]init];
        self.bgImageView = bgImageView;
        self.backgroundView = bgImageView;
        self.selectImageView = bgImageView;
    }
    return self;
}

- (void)setBgImageName:(NSString *)bgImageName
{
    _bgImageName = bgImageName;
    
    self.bgImageView.image = [UIImage imageNamed:bgImageName];
    
}





@end










