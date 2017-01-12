//
//  TransitionAnimationViewController.m
//  CoreAnimationDamo
//
//  Created by leileigege on 2017/1/12.
//  Copyright © 2017年 leileigege. All rights reserved.
//

#import "TransitionAnimationViewController.h"

@interface TransitionAnimationViewController ()

@end

@implementation TransitionAnimationViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

#pragma mark - 四种UIView转场动画
- (IBAction)ViewAnimation:(UIButton *)sender {
    int index=[sender.titleLabel.text intValue];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.5];
    switch (index) {
        case 1:
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
            break;
        case 2:
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
            break;
        case 3:
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
            break;
        case 4:
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
            break;
            
        default:
            break;
    }
    [UIView commitAnimations];
    
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
}

#pragma mark - 十二种核心动画转场动画
- (IBAction)coreAnimation:(UIButton *)sender {
    int index=[sender.titleLabel.text intValue];
    CATransition *transition=[CATransition animation];
    transition.duration=1;
    transition.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    switch (index) {
        case 5:
            transition.type=kCATransitionFade;
            break;
        case 6:
            transition.type=kCATransitionPush;
            break;
        case 7:
            transition.type=kCATransitionReveal;
            break;
        case 8:
            transition.type=kCATransitionMoveIn;
            break;
            //8中私有API
        case 9:
            transition.type=@"cube";
            break;
        case 10:
            transition.type= @"suckEffect";
            break;
        case 11:
            transition.type=@"oglFlip";
            break;
        case 12:
            transition.type=@"rippleEffect";
            break;
        case 13:
            transition.type=@"pageCurl";
            break;
        case 14:
            transition.type= @"pageUnCurl";
            break;
        case 15:
            transition.type=@"cameraIrisHollowOpen";
            break;
        case 16:
            transition.type=@"cameraIrisHollowClose";
            break;
            
        default:
            break;
    }
    int subTypeIndex=arc4random()%4;
    switch (subTypeIndex) {
        case 0:
            transition.subtype=kCATransitionFromLeft;
            break;
        case 1:
            transition.subtype=kCATransitionFromBottom;
            break;
        case 2:
            transition.subtype=kCATransitionFromRight;
            break;
        case 3:
            transition.subtype=kCATransitionFromTop;
            break;
            
        default:
            break;
    }
    transition.startProgress=0.0;
    transition.endProgress=1.0;
    [self.view.layer addAnimation:transition forKey:@"transition"];
    
    
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
}



- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
