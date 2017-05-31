//
//  RootViewController.m
//  LottieDemo
//
//  Created by 刘冉 on 2017/5/31.
//  Copyright © 2017年 刘冉. All rights reserved.
//

#import "RootViewController.h"
#import "TranstionViewController.h"
#import <Lottie/Lottie.h>

@interface RootViewController ()

@property(nonatomic,strong)UILabel* note1;
@property(nonatomic,strong)UILabel* note2;
@property(nonatomic,strong)LOTAnimationView* animationView;
@property(nonatomic,strong)LOTAnimationView* UrlAnimation;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.note1];
    [self.view addSubview:self.note2];
    
    //加载本地的json动画
    self.animationView = [LOTAnimationView animationNamed:@"loading"];
    self.animationView.contentMode = UIViewContentModeScaleToFill;
    self.animationView.loopAnimation = YES;
    [UIView animateWithDuration:3.0 delay:0.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        self.animationView.transform = CGAffineTransformScale(self.animationView.transform, 0.2, 0.3);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3.0 animations:^{
            self.animationView.transform = CGAffineTransformIdentity;
        }];
    }];
    [self.view addSubview:self.animationView];
    [self.animationView playWithCompletion:^(BOOL animationFinished) {
        NSLog(@"播放完毕");
    }];
    
    //加载网络json动画
    self.UrlAnimation = [[LOTAnimationView alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://github.com/airbnb/lottie-ios/raw/master/Example/Assets/PinJump.json"]];
    self.UrlAnimation.frame = CGRectMake(100, self.view.bounds.size.height/2+40, 200, 200);
    [self.UrlAnimation play];
    self.UrlAnimation.loopAnimation = YES;
    [self.view addSubview:self.UrlAnimation];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self presentViewController:[[TranstionViewController alloc] init]animated:YES completion:NULL];
}

-(UILabel *)note1{
    if (!_note1) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, 150, 40)];
        label.text = @"加载本地json动画";
        _note1 = label;
    }
    return _note1;
}

-(UILabel *)note2{
    if (!_note2) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, self.view.bounds.size.height/2, 150, 40)];
        label.text = @"加载网络动画";
        _note2 = label;
    }
    return _note2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
