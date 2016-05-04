//
//  PushAnimation.m
//  TransitionAnimation
//
//  Created by lee on 16/5/3.
//  Copyright © 2016年 Meeno5. All rights reserved.
//

#import "PushAnimation.h"

@implementation PushAnimation

- (void)transitionAnimation
{
    //将选中的图片添加到容器view中,并设置图片位置与点击时的位置相同
    UIImageView *transitionImageView  = [[UIImageView alloc] initWithFrame:self.transitionImageFrame];
    transitionImageView.image = self.transitionImage.image;
    [self.containerView addSubview:self.toVC.view];
    [self.containerView addSubview:transitionImageView];
    
    //隐藏起始控制器
    self.toVC.view.alpha = 0;
    self.fromVC.view.alpha = 0.f;
    //为转场图片添加阴影
    transitionImageView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    transitionImageView.layer.shadowOpacity = 1;
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.f options:0 animations:^{
        //设置图片最终位置
        transitionImageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        transitionImageView.frame = transitionFrame;
    } completion:^(BOOL finished) {
        //移除阴影
        transitionImageView.layer.shadowOpacity = 0;
    }];
    
    [UIView animateWithDuration:0.5 delay:0.7 usingSpringWithDamping:1 initialSpringVelocity:0.f options:0 animations:^{
        transitionImageView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        //显示目标控制器
        [self circleTransitionAnimation];
        self.toVC.view.alpha   = 1.f;
        [transitionImageView removeFromSuperview];
        [self completeTransition];
    }];
}

- (void)circleTransitionAnimation
{
    //初始圆形的范围
    CGRect startFrame = CGRectMake((kScreenW - 200) / 2, (kScreenH - 200) / 2, 200, 200);
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:startFrame];
    
    CGPoint extremePoint = CGPointMake(self.containerView.center.x, self.containerView.center.y);
    //圆形半径
    float radius = sqrtf(extremePoint.x * extremePoint.x + extremePoint.y * extremePoint.y);
    //最终圆形的范围
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(startFrame, -radius, -radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = finalPath.CGPath;
    self.toVC.view.layer.mask = maskLayer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id _Nullable)(bezierPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(finalPath.CGPath);
    animation.duration = [self transitionDuration:self.transitionContext];
    animation.delegate = self;
    [maskLayer addAnimation:animation forKey:@"path"];
}

@end
