//
//  KeyframeViewController.m
//  CoreAnimationDamo
//
//  Created by leileigege on 2017/1/12.
//  Copyright © 2017年 leileigege. All rights reserved.
//
#define ANGLE(x) M_PI/180*x
#import "KeyframeViewController.h"

@interface KeyframeViewController ()<CAAnimationDelegate>

@end

@implementation KeyframeViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma mark - Event Response

#pragma mark  move

- (IBAction)move:(UIButton *)sender {
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrame.duration = 2;
    keyFrame.removedOnCompletion = NO;
    keyFrame.delegate = self;
    keyFrame.fillMode = kCAFillModeForwards;
    keyFrame.values = @[[NSValue valueWithCGPoint:_animationView.layer.position],[NSValue valueWithCGPoint:CGPointMake(arc4random_uniform(200), arc4random_uniform(300))],[NSValue valueWithCGPoint:CGPointMake(arc4random_uniform(200), arc4random_uniform(300))]];
    // 数组表示经过每一帧的时间,数组中的值必须从小到大,最小值为0,最大值为1
    //keyFrame.keyTimes = @[@0.5,@0.9999,@1];

    [_animationView.layer addAnimation:keyFrame forKey:@"keyFrame"];
}
// 核心动画不会影响layer的位置
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CAKeyframeAnimation *keyFrame = (CAKeyframeAnimation *)anim;
    _animationView.layer.position = [[keyFrame.values lastObject] CGPointValue];
    NSLog(@"%@",NSStringFromCGRect(_animationView.frame));
}
#pragma mark  shake
- (IBAction)shake:(UIButton *)sender {
    CAKeyframeAnimation *shake = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    shake.repeatCount = MAXFLOAT;
    shake.autoreverses = YES;
    shake.values = @[@(ANGLE(-10)),@(ANGLE(10))];
    shake.duration = .05;
    [_animationView.layer addAnimation:shake forKey:@"shake"];
}

#pragma mark  path

- (IBAction)path:(UIButton *)sender {
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //动画时间
    pathAnimation.duration = 2;
    //重复次数
    pathAnimation.repeatCount = LONG_MAX;
    //创建path
    CGMutablePathRef path = CGPathCreateMutable();
    //为path赋值，参数1.path 参数2.仿射变化 参数3.路径。
    CGPathAddRect(path, nil, self.view.bounds);
    pathAnimation.path = path;
    //释放path
    CGPathRelease(path);
    [_animationView.layer addAnimation:pathAnimation forKey:@"path"];
    
    
}

#pragma mark  group

- (IBAction)group:(UIButton *)sender {
    ///创建三个动画
    CABasicAnimation *scale=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue=@1.0;
    scale.toValue=@0.5;
    
    
    
    CABasicAnimation *opcityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opcityAnimation.fromValue = @1;
    opcityAnimation.toValue = @0.5;
    
    
    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    CGFloat angel = M_PI_4 / 8;
    shakeAnimation.duration = .3;
    [shakeAnimation setValues:@[@(angel), @(-angel), @(angel)]];
    //创建组动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    //将三个动画放入数组
    group.animations = @[scale,opcityAnimation,shakeAnimation];
    group.repeatCount = MAXFLOAT;
    //设置时间
    group.duration = 1;
    //添加动画
    [_animationView.layer addAnimation:group forKey:@"group"];
}

#pragma mark  touch

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //点击屏幕移除所有动画
    [_animationView.layer removeAllAnimations];
    
}

    
    
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}




@end
