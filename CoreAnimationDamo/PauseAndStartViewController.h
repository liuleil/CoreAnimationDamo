//
//  PauseAndStartViewController.h
//  CoreAnimationDamo
//
//  Created by leileigege on 2017/1/12.
//  Copyright © 2017年 leileigege. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PauseAndStartViewController : UIViewController
- (IBAction)buttonPress:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *redView;

- (IBAction)back:(UIButton *)sender;

@end
