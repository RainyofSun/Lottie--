//
//  TranslationTwoViewController.m
//  LottieDemo
//
//  Created by 刘冉 on 2017/5/31.
//  Copyright © 2017年 刘冉. All rights reserved.
//

#import "TranslationTwoViewController.h"

@interface TranslationTwoViewController ()

@end

@implementation TranslationTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
