//
//  KeyframeViewController.h
//  CoreAnimationDamo
//
//  Created by leileigege on 2017/1/12.
//  Copyright © 2017年 leileigege. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyframeViewController : UIViewController
- (IBAction)move:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *animationView;
- (IBAction)shake:(UIButton *)sender;
- (IBAction)path:(UIButton *)sender;
- (IBAction)group:(UIButton *)sender;

@end
