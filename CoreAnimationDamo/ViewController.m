//
//  ViewController.m
//  CoreAnimationDamo
//
//  Created by leileigege on 2017/1/11.
//  Copyright © 2017年 leileigege. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
