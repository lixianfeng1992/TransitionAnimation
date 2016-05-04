//
//  SecondViewController.m
//  TransitionAnimation
//
//  Created by lee on 16/5/3.
//  Copyright © 2016年 Meeno5. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
#import "PopAnimation.h"

@interface SecondViewController ()<UINavigationControllerDelegate>
@property (nonatomic, weak) UIImageView *selectedImage;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton =YES;
    
    self.navigationController.delegate = self;
    
    //self.view.backgroundColor = [UIColor colorWithRed:240.0 /255 green:240.0 /255 blue:240.0 /255 alpha:1];
    self.view.backgroundColor = [UIColor orangeColor];
    [self creatImageView];
    
    [self addLabel];
}

- (void)creatImageView
{
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.userInteractionEnabled = YES;
    iconView.image = [UIImage imageNamed:self.iconName];
    [self.view addSubview:iconView];
    iconView.frame = CGRectMake((kScreenW - 100) / 2, (kScreenH - 100) / 2, 100, 100);
    self.selectedImage = iconView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backToRootViewController)];
    [iconView addGestureRecognizer:tap];
}

- (void)addLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"点击图片返回";
    label.frame = CGRectMake((kScreenW - 200) / 2, kScreenH - 100, 200, 50);
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)backToRootViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    PopAnimation *transition = [[PopAnimation alloc] init];
    transition.duration = 0.5;
    transition.transitionImage = self.selectedImage;
    transition.fromImageFrame = self.fromImageFrame;
    return transition;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
