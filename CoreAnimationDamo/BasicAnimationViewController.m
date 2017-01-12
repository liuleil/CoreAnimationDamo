//
//  BasicAnimationViewController.m
//  CoreAnimationDamo
//
//  Created by leileigege on 2017/1/11.
//  Copyright © 2017年 leileigege. All rights reserved.
//

#import "BasicAnimationViewController.h"
#import "PositionViewController.h"
@interface BasicAnimationViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy) NSArray *typeArr;
@property(nonatomic,copy) NSArray *locationArr;

@end

@implementation BasicAnimationViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.typeArr = @[@"位移",@"旋转位移",@"暂停/继续控制"];
    self.locationArr = @[@"PositionViewController",@"RotationAndPosition",@"PauseAndStartViewController"];
  
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
       [self.navigationController setNavigationBarHidden:NO animated:YES];

}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.typeArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID] ;
       
    }
     cell.textLabel.text = self.typeArr[indexPath.row];
     cell.detailTextLabel.text = [NSString stringWithFormat:@"%@.m",self.locationArr[indexPath.row]];
    
    return cell;



}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    PositionViewController *positionViewController = [storyboard instantiateViewControllerWithIdentifier:[NSString stringWithFormat:@"%@",self.locationArr[indexPath.row]]];
    [self.navigationController pushViewController:positionViewController animated:YES];
    





}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
