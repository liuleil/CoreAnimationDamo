//
//  PauseAndStartViewController.m
//  CoreAnimationDamo
//
//  Created by leileigege on 2017/1/12.
//  Copyright © 2017年 leileigege. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#import "PauseAndStartViewController.h"

@interface PauseAndStartViewController ()<CAAnimationDelegate>

@end

@implementation PauseAndStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doAnimation];
  
}
-(void)doAnimation{
    [self addAnimation1];
    [self addAnimation2];
    
    
}
-(void)addAnimation1{
    CABasicAnimation *basAni = [CABasicAnimation animationWithKeyPath:@"position"];
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
    [self.redView.layer addAnimation:basAni forKey:@"base1"];
    
}
-(void)addAnimation2{
    CABasicAnimation *basAni2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basAni2.fromValue = @0;
    basAni2.toValue = @M_PI;
    basAni2.beginTime = CACurrentMediaTime() ;
    basAni2.repeatCount = LONG_MAX;
    basAni2.removedOnCompletion = NO;
    [self.redView.layer addAnimation:basAni2 forKey:@"base2"];
    
}


int count = 0 ;
- (IBAction)buttonPress:(UIButton *)sender {
    
    count ++;
    if (count % 2 == 1) {
        _redView.layer.speed = 0;
        _redView.layer.timeOffset = CACurrentMediaTime() - _redView.layer.beginTime;
    } else {
        _redView.layer.speed = 1;
        _redView.layer.beginTime = CACurrentMediaTime() - _redView.layer.timeOffset;
        _redView.layer.timeOffset = 0;
    }
    

}
@end
