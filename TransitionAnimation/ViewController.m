//
//  ViewController.m
//  TransitionAnimation
//
//  Created by Meeno5 on 16/5/3.
//  Copyright © 2016年 Meeno5. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
#import "MyLayout.h"
#import "SecondViewController.h"
#import "PushAnimation.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, weak) UIImageView *currentImageView;

@property (nonatomic, assign) CGRect currentFrame;

@end

@implementation ViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[MyCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.currentImageView.hidden = NO;
    
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.currentImageView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.bgImageName = [NSString stringWithFormat:@"avatar%d", (int)indexPath.item + 1];
    
    return cell;
}

- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
        MyLayout *layout = [[MyLayout alloc] init];
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor colorWithRed:240.0 /255 green:240.0 /255 blue:240.0 /255 alpha:1];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
	}
	return _collectionView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.iconName = [NSString stringWithFormat:@"avatar%d", (int)indexPath.item + 1];
    self.currentImageView = ((MyCell *)[collectionView cellForItemAtIndexPath:indexPath]).selectImageView;
    self.currentFrame = ((MyCell *)[collectionView cellForItemAtIndexPath:indexPath]).frame;
    secondVC.fromImageFrame = ((MyCell *)[collectionView cellForItemAtIndexPath:indexPath]).frame;
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    PushAnimation *transition = [[PushAnimation alloc] init];
    transition.duration = 0.5;
    transition.transitionImageFrame = self.currentFrame;
    transition.transitionImage = self.currentImageView;
    return transition;
}

@end
