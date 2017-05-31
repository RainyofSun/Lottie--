//
//  TranstionViewController.m
//  LottieDemo
//
//  Created by 刘冉 on 2017/5/31.
//  Copyright © 2017年 刘冉. All rights reserved.
//

#import "TranstionViewController.h"
#import "TranslationTwoViewController.h"
#import <Lottie/Lottie.h>

@interface TranstionViewController ()<UIViewControllerTransitioningDelegate>

@property(nonatomic,strong)UIButton* transtionBtn;

@end

@implementation TranstionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.transtionBtn];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(UIButton *)transtionBtn{
    if (!_transtionBtn) {
        _transtionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _transtionBtn.backgroundColor = [UIColor orangeColor];
        [_transtionBtn addTarget:self action:@selector(transtionBtn:) forControlEvents:UIControlEventTouchUpInside];
        _transtionBtn.frame = CGRectMake(30, 100, 80, 40);
    }
    return _transtionBtn;
}

-(void)transtionBtn:(UIButton*)sender{
    TranslationTwoViewController* two = [[TranslationTwoViewController alloc] init];
    two.transitioningDelegate = self;
    [self presentViewController:two animated:YES completion:^{
        
    }];
}

#pragma mark - UIViewControllerTransitioningDelegate
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    LOTAnimationTransitionController* animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"countdown" fromLayerNamed:@"" toLayerNamed:@""];
    return animationController;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    LOTAnimationTransitionController* animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"countdown" fromLayerNamed:@"" toLayerNamed:@""];
    return animationController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
