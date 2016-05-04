//
//  PopAnimation.m
//  TransitionAnimation
//
//  Created by lee on 16/5/3.
//  Copyright © 2016年 Meeno5. All rights reserved.
//

#import "PopAnimation.h"

@implementation PopAnimation

- (void)transitionAnimation {
    
    UIImageView *transitionImageView  = [[UIImageView alloc] initWithFrame:destinationFrame];
    transitionImageView.image = self.transitionImage.image;
    
    [self.containerView addSubview:self.toVC.view];
    [self.containerView addSubview:transitionImageView];
    
    self.fromVC.view.alpha = 0.f;
    self.toVC.view.alpha = 0;
    
    [UIView animateWithDuration:self.duration delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.f options:0 animations:^{
        transitionImageView.frame = self.fromImageFrame;
        
        self.toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        
        [transitionImageView removeFromSuperview];
        [self completeTransition];
    }];
}

@end
