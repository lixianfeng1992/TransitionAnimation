//
//  Animator.h
//  TransitionAnimation
//
//  Created by lee on 16/5/3.
//  Copyright © 2016年 Meeno5. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animator : NSObject<UIViewControllerAnimatedTransitioning>
/**
 *  选中图片在控制器中的frame（由于图片是在collectionview的item中，直接拿frame的话坐标系不同）
 */
@property (nonatomic, assign) CGRect transitionImageFrame;
/**
 *  选中图片
 */
@property (nonatomic, strong) UIImageView *transitionImage;
/**
 *  起始控制器
 */
@property (nonatomic, strong) UIViewController *fromVC;
/**
 *  目标控制器
 */
@property (nonatomic, strong) UIViewController *toVC;
/**
 *  容器view
 */
@property (nonatomic, strong) UIView *containerView;
/**
 *  动画持续时间
 */
@property (nonatomic, assign) CGFloat duration;
/**
 *  转场动画上下文
 */
@property (nonatomic, weak) id <UIViewControllerContextTransitioning> transitionContext;
/**
 *  动画具体实现方法，由子类重写
 */
- (void)transitionAnimation;
/**
 *  动画执行完毕
 */
- (void)completeTransition;

@end
