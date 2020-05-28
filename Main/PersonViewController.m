//
//  PersonViewController.m
//  DrinkWater
//
//  Created by 纪明 on 2020/2/16.
//  Copyright © 2020 纪明. All rights reserved.
//

#import "PersonViewController.h"
#import "LooginViewController.h"
#import "DrinkHistoryViewController.h"
#import "FeedBackViewController.h"
#import "AboutViewController.h"
@interface PersonViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView      *    tableView;
@property (nonatomic, strong) NSArray          *    dataList;
@end

@implementation PersonViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.dataList=@[@[@"Drink Goal",@"Drink History"],@[@"Feedback",@"About Us",@"Share"]];
       [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, self.naviView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT-self.naviView.bottom) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.rowHeight=46*KScaleH;
        _tableView.backgroundColor=APP_NAVI_COLOR;
        _tableView.separatorColor=[UIColor whiteColor];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        if (indexPath.row==1) {
            DrinkHistoryViewController  *  vc=[[DrinkHistoryViewController alloc]init];
            [self.navigationController pushViewController:vc animated:NO];
        }
    }
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            FeedBackViewController  *  vc=[[FeedBackViewController alloc]init];
            [self.navigationController pushViewController:vc animated:NO];
        }else if(indexPath.row==1){
            AboutViewController  *  vc=[[AboutViewController alloc]init];

            [self.navigationController pushViewController:vc animated:NO];
        }else{
            NSString *shareText = @"Drinking Assistant!";
                         UIImage *shareImage = [UIImage imageNamed:@"icon"];
                          NSArray *activityItemsArray = @[shareText,shareImage];
                            UIActivityViewController *activityController=[[UIActivityViewController alloc]initWithActivityItems:activityItemsArray applicationActivities:nil];
                            [self.navigationController presentViewController:activityController animated:YES completion:nil];
            }
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
   cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        }
   cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.text=self.dataList[indexPath.section][indexPath.row];
    cell.textLabel.font=APP_NORMAL_FONT(18.0);
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.detailTextLabel.textColor=[UIColor whiteColor];
    cell.detailTextLabel.font=APP_NORMAL_FONT(18.0);
   cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"next"]];
    cell.backgroundColor=APP_NAVI_COLOR;
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            NSUserDefaults  *  defaults=[NSUserDefaults standardUserDefaults];
            NSString   *  goal=[defaults objectForKey:@"waterTotal"];
            if ([goal isEmpty]) {
                 cell.detailTextLabel.text=@"0ml";
            }else{
                cell.detailTextLabel.text=[NSString stringWithFormat:@"%@ml",goal];
            };
        }
    }
  return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataList.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * array=self.dataList[section];
    return array.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 123.5*KScaleH;
    }else{
       return  63.5*KScaleH;
    }
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 0.01;
    }else{
        return 0.01;
    }
}
#pragma mark - 自定义headerView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        UIView  *  bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 123.5*KScaleH)];
        bgView.backgroundColor=APP_NAVI_COLOR;
         UILabel  *  titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(25*KScaleW, 10, SCREEN_WIDTH-25*KScaleW, 18.5*KScaleH)];
               titleLabel.textAlignment=NSTextAlignmentLeft;
               titleLabel.font=APP_BOLD_FONT(24.0);
               titleLabel.textColor=[UIColor whiteColor];
               titleLabel.text=@"Profile";
               [bgView addSubview:titleLabel];
        
        UIImageView  *  avatar=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon"]];
        avatar.frame=CGRectMake(20*KScaleW, titleLabel.bottom+18*KScaleH, 71*KScaleW, 71*KScaleW);
        [avatar setRadius:35.5*KScaleW];
        avatar.contentMode=UIViewContentModeScaleToFill;
        avatar.clipsToBounds=YES;
        [bgView addSubview:avatar];
        
        UILabel  *  userLabel=[[UILabel alloc]initWithFrame:CGRectMake(avatar.right+17*KScaleW, avatar.centerY-9*KScaleH, SCREEN_WIDTH-avatar.right-17*KScaleW, 18*KScaleH)];
        userLabel.textAlignment=NSTextAlignmentLeft;
        userLabel.font=APP_NORMAL_FONT(24.0);
        userLabel.textColor=[UIColor whiteColor];
        userLabel.text=@"Drink";
        [bgView addSubview:userLabel];
        return bgView;
    }else{
        UIView  *  bgView=[[UIView alloc]initWithFrame:(CGRect)CGRectMake(0, 0, SCREEN_WIDTH, 63.5*KScaleH)];
        UILabel  *  titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(25*KScaleW, 0, SCREEN_WIDTH-25*KScaleW, 63.5*KScaleH)];
        titleLabel.textAlignment=NSTextAlignmentLeft;
        titleLabel.font=APP_BOLD_FONT(24.0);
        titleLabel.textColor=[UIColor whiteColor];
        titleLabel.text=@"Support";
        [bgView addSubview:titleLabel];
        bgView.backgroundColor=APP_NAVI_COLOR;
        return bgView;
    }
   
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==0) {
        UIView  *   bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.1)];
        bgView.backgroundColor=APP_NAVI_COLOR;
        return bgView;
    }else{
//        UIView  *   bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 168.5)];
//        bgView.userInteractionEnabled=YES;
//        UIButton  *  logOutBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-164.5*KScaleW)/2, 60*KScaleH, 164.5*KScaleW, 48.5*KScaleH)];
//        logOutBtn.backgroundColor=APP_NAVI_COLOR;
//        [logOutBtn setRadius:5.0];
//        logOutBtn.layer.borderColor=[UIColor whiteColor].CGColor;
//        logOutBtn.layer.borderWidth=2.0;
//        [logOutBtn setTitle:@"Log Out" forState:UIControlStateNormal];
//        [logOutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [logOutBtn addTarget:self action:@selector(logOut) forControlEvents:UIControlEventTouchUpInside];
//        [bgView addSubview:logOutBtn];
//
//        bgView.backgroundColor=APP_NAVI_COLOR;
//              return bgView;
        return nil;
    }
}

-(void)logOut{
    LooginViewController *loginVC = [[NSClassFromString(@"LooginViewController") alloc]init];
                  BaseNavigationController *loginNav = [[BaseNavigationController alloc]initWithRootViewController:loginVC];
                  __weak __typeof(loginNav)weakLogin = loginNav;
                  loginVC.loginSuccessBlock = ^{

                      [weakLogin dismissViewControllerAnimated:YES completion:^{
                          [self.tableView reloadData];
                      }];

                  };
                  [self presentViewController:loginNav animated:YES completion:nil];
}
@end
