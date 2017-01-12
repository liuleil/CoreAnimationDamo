//
//  RotationAndPosition.m
//  CoreAnimationDamo
//
//  Created by leileigege on 2017/1/12.
//  Copyright © 2017年 leileigege. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#import "RotationAndPosition.h"

@interface RotationAndPosition ()

@end

@implementation RotationAndPosition

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doAnimation];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
#pragma mark - Custom methods

-(void)doAnimation{
    [self addAnimation1];
    [self addAnimation2];

    
}
#pragma mark - addAnimation1

-(void)addAnimation1{
    CABasicAnimation *basAni = [CABasicAnimation animationWithKeyPath:@"position"];
    //CABasicAnimation
    basAni.fromValue = [NSValue valueWithCGPoint:CGPointZero];
    
    basAni.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    basAni.beginTime = CACurrentMediaTime() ;
    basAni.duration = 5;
    basAni.repeatCount = LONG_MAX;
    basAni.autoreverses = YES;
    basAni.speed = 3;
    basAni.fillMode = kCAFillModeRemoved;
    basAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    basAni.removedOnCompletion = NO;
    [self.blueView.layer addAnimation:basAni forKey:@"base1"];

}
#pragma mark - addAnimation2

-(void)addAnimation2{
    CABasicAnimation *basAni2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    basAni2.fromValue = @0;
    basAni2.toValue = @M_PI;
    basAni2.beginTime = CACurrentMediaTime() ;
    basAni2.repeatCount = LONG_MAX;
    basAni2.removedOnCompletion = NO;
    [self.blueView.layer addAnimation:basAni2 forKey:@"base2"];

}

#pragma mark - Event Response

- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
