//
//  PositionViewController.m
//  CoreAnimationDamo
//
//  Created by leileigege on 2017/1/11.
//  Copyright © 2017年 leileigege. All rights reserved.
//

#import "PositionViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface PositionViewController ()<CAAnimationDelegate>

@end

@implementation PositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doAnimation];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
  
}
-(void)doAnimation{
    CABasicAnimation *basAni = [CABasicAnimation animationWithKeyPath:@"position"];
    
    //CABasicAnimation
    basAni.fromValue = [NSValue valueWithCGPoint:CGPointZero];
    
    basAni.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    //CAMediaTiming
    //设置动画的开始时间
    basAni.beginTime = CACurrentMediaTime() ;
    //设置动画的持续时间(单次的)
    basAni.duration = 2;
    //设置动画的重复次数
    basAni.repeatCount = 2;
    //设置动画的重复时间
//    basAni.repeatDuration = 1;
    //设置动画的自动翻转
    basAni.autoreverses = YES;
    //设置时光流速
    basAni.speed = 3;
    //设置时光偏移量
    //basAni.timeOffset = 3;
  
    //设置动画在非active内的行为,开始之前结束之后
    basAni.fillMode = kCAFillModeRemoved;
    
    //CAAnimation
    //设置动画的速率
    /*
     CA_EXTERN NSString * const kCAMediaTimingFunctionLinear
     CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
     CA_EXTERN NSString * const kCAMediaTimingFunctionEaseIn
     CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
     CA_EXTERN NSString * const kCAMediaTimingFunctionEaseOut
     CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
     CA_EXTERN NSString * const kCAMediaTimingFunctionEaseInEaseOut
     CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
     CA_EXTERN NSString * const kCAMediaTimingFunctionDefault
     CA_AVAILABLE_STARTING (10.6, 3.0, 9.0, 2.0);
*/
    basAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //设置委托,能够获取动画开始和结束
 
    //设置动画结束以后,是否移除
    basAni.removedOnCompletion = NO;
    //添加动画
    basAni.delegate = self;
    [self.blueView.layer addAnimation:basAni forKey:@"base"];
    





}
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"动画开始");
}
// 核心动画,只有动画,位置自始至终都没有改变
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    NSLog(@"动画结束");

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}



- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
