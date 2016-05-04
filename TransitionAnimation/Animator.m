//
//  Animator.m
//  TransitionAnimation
//
//  Created by lee on 16/5/3.
//  Copyright © 2016年 Meeno5. All rights reserved.
//

#import "Animator.h"

@implementation Animator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    self.fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    self.toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    self.containerView = [transitionContext containerView];
    self.containerView.backgroundColor = [UIColor colorWithRed:240.0 /255 green:240.0 /255 blue:240.0 /255 alpha:1];
    self.transitionContext = transitionContext;
    
    [self transitionAnimation];
}

- (void)transitionAnimation
{
    
}

- (void)completeTransition
{
    [self.transitionContext completeTransition:!self.transitionContext.transitionWasCancelled];
}

@end
