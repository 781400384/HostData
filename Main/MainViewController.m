//
//  MainViewController.m
//  DrinkWater
//
//  Created by 纪明 on 2020/2/16.
//  Copyright © 2020 纪明. All rights reserved.
//

#import "MainViewController.h"
#import "LooginViewController.h"
#import "MainTableViewCell.h"
#import "ZYProGressView.h"
#import "GoalViewController.h"
#import "EnterWaterViewController.h"
#import "PersonViewController.h"
@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate>{
    
    UILabel  *   prograssNum;
    UILabel   *   startNum;
    UILabel   *   totalNum;
    ZYProGressView *progress;
}

@property (nonatomic, strong) UITableView   *     tableView;
@property (nonatomic, strong) NSMutableArray *    dataList;
@end

@implementation MainViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSString *home = NSHomeDirectory();
       NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
       NSString *filepath = [docPath stringByAppendingPathComponent:@"data.plist"];
       self.dataList=[NSMutableArray arrayWithContentsOfFile:filepath];
       NSLog(@"self=%@",self.dataList);
       [self.tableView reloadData];
       [self reloadHeaderView];
       [self configUI];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.naviView.leftItemButton.hidden=YES;
    
    [self.naviView.rightItemButton setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [self.naviView.rightItemButton addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel   *   titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(15*KScaleW, IS_X?NAVI_SUBVIEW_Y_iphoneX:NAVI_SUBVIEW_Y_Normal, SCREEN_WIDTH-80*KScaleW, 20*KScaleH)];
         titleLabel.font=APP_BOLD_FONT(20.0);
     titleLabel.text=@"HELLO";
     titleLabel.textColor=[UIColor whiteColor];
     titleLabel.textAlignment=NSTextAlignmentLeft;
     [self.naviView addSubview:titleLabel];
     
    UILabel  * descLabel=[[UILabel alloc]initWithFrame:CGRectMake(15*KScaleW, titleLabel.bottom+5*KScaleH
                                                                         , SCREEN_WIDTH-80*KScaleW, 13*KScaleH)];
           descLabel.font=APP_BOLD_FONT(13.0);
     descLabel.textColor=[UIColor whiteColor];
     descLabel.textAlignment=NSTextAlignmentLeft;
     [self.naviView addSubview:descLabel];
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEEE,MMMM   dd"];
    descLabel.text = [formatter stringFromDate:date];
    
}

-(void)more{
    PersonViewController  *  vc=[[PersonViewController alloc]init];
    [self.navigationController pushViewController:vc animated:NO];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, self.naviView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT-self.naviView.bottom) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.rowHeight=56*KScaleH;
        _tableView.backgroundColor=[UIColor whiteColor];
        _tableView.separatorColor=[UIColor clearColor];
        _tableView.tableHeaderView=[self setHeaderView];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   MainTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
   cell= [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
   cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.timeLabel.text=[self.dataList[indexPath.row] valueForKey:@"time"];
    if ([[self.dataList[indexPath.row] valueForKey:@"type"] isEqualToString:@"water"]) {
        cell.typeImg.image=[UIImage imageNamed:@"water"];
    }
    if ([[self.dataList[indexPath.row] valueForKey:@"type"] isEqualToString:@"coffee"]) {
           cell.typeImg.image=[UIImage imageNamed:@"coffee"];
       }
    if ([[self.dataList[indexPath.row] valueForKey:@"type"] isEqualToString:@"milk"]) {
           cell.typeImg.image=[UIImage imageNamed:@"milk"];
       }
    if ([[self.dataList[indexPath.row] valueForKey:@"type"] isEqualToString:@"other"]) {
           cell.typeImg.image=[UIImage imageNamed:@"other"];
       }
    cell.waterLabel.text=[NSString stringWithFormat:@"%@ml",[self.dataList[indexPath.row] valueForKey:@"num"]];
  return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSMutableArray   *  data=[[NSMutableArray alloc] init];
   NSString *home = NSHomeDirectory();
   NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
   NSString *filepath = [docPath stringByAppendingPathComponent:@"data.plist"];
   data=[NSMutableArray arrayWithContentsOfFile:filepath];
   [self.dataList removeObjectAtIndex:indexPath.row];
   [self.dataList writeToFile:filepath atomically:YES];
   [self.tableView reloadData];
}

//修改默认Delete按钮的文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Delete";
}
-(UIView *)setHeaderView{
    UIView * bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 280*KScaleH)];
    bgView.backgroundColor=APP_NAVI_COLOR;
    
    UILabel  *   prograssLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 22*KScaleH, SCREEN_WIDTH, 14.5*KScaleH)];
    prograssLabel.textColor=[UIColor whiteColor];
    prograssLabel.font=APP_NORMAL_FONT(15.0);
    prograssLabel.text=@"Completed";
    prograssLabel.textAlignment=NSTextAlignmentCenter;
    [bgView addSubview:prograssLabel];
      NSUserDefaults  * defaults=[NSUserDefaults standardUserDefaults];
    prograssNum=[[UILabel alloc]initWithFrame:CGRectMake(0,prograssLabel.bottom+16.5*KScaleH, SCREEN_WIDTH, 18.5*KScaleH)];
       prograssNum.textColor=[UIColor whiteColor];
       prograssNum.font=APP_BOLD_FONT(24.0);
       prograssNum.textAlignment=NSTextAlignmentCenter;
       [bgView addSubview:prograssNum];
    
    UILabel   *   startLabel=[[UILabel alloc]initWithFrame:CGRectMake(13.5*KScaleW, prograssNum.bottom+42*KScaleH, SCREEN_WIDTH/2-13.5*KScaleW, 14*KScaleH)];
    startLabel.textColor=[UIColor whiteColor];
    startLabel.font=APP_NORMAL_FONT(18.0);
    startLabel.text=@"Current intake";
    startLabel.textAlignment=NSTextAlignmentLeft;
    [bgView addSubview:startLabel];
    
    
  
   
    
    startNum=[[UILabel alloc]initWithFrame:CGRectMake(32*KScaleW, startLabel.bottom+15.5*KScaleH, SCREEN_WIDTH/2-32*KScaleW, 18.5*KScaleH)];
       startNum.textColor=[UIColor whiteColor];
       startNum.font=APP_BOLD_FONT(24.0);
    startNum.text=[NSString stringWithFormat:@"%dml",[[defaults objectForKey:@"haveDrink"] intValue]];
       startNum.textAlignment=NSTextAlignmentLeft;
 
       [bgView addSubview:startNum];
   
    
    UILabel   *   totalLabel=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, prograssNum.bottom+42*KScaleH, SCREEN_WIDTH/2-29*KScaleW, 14*KScaleH)];
    totalLabel.textColor=[UIColor whiteColor];
    totalLabel.font=APP_NORMAL_FONT(18.0);
    totalLabel.text=@"Goal";
    totalLabel.textAlignment=NSTextAlignmentRight;
    [bgView addSubview:totalLabel];
    
    totalNum=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, totalLabel.bottom+15.5*KScaleH, SCREEN_WIDTH/2-29*KScaleW, 18.5*KScaleH)];
    totalNum.textColor=[UIColor whiteColor];
    totalNum.font=APP_BOLD_FONT(24.0);
    NSString   *  goal=[defaults objectForKey:@"waterTotal"];
    totalNum.text=[NSString stringWithFormat:@"%dml",[goal intValue]];
    totalNum.textAlignment=NSTextAlignmentRight;
    [bgView addSubview:totalNum];
    
     progress=[[ZYProGressView alloc]initWithFrame:CGRectMake(34*KScaleW, totalNum.bottom+20*KScaleH, SCREEN_WIDTH-68*KScaleW,35*KScaleH)];
    progress.progressValue=[NSString stringWithFormat:@"%f",[startNum.text doubleValue]/[totalNum.text doubleValue]];
     [bgView addSubview:progress];
    if ([totalNum.text intValue]==0) {
        prograssNum.text=@"0%";
    }else{
        prograssNum.text= [NSString stringWithFormat:@"%f%%",[startNum.text doubleValue]/[goal doubleValue]*100];
        
    }
//    NSLog(@"%@",prograssNum.text);
    if ([startNum.text doubleValue]/[goal doubleValue]*100>100) {
                    [self show];
                }
        
    
    UILabel  *  titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, bgView.height-31.5*KScaleH, SCREEN_WIDTH, 31.5*KScaleH)];
    titleLabel.backgroundColor=[UIColor colorWithHexString:@"#F1F1F1"];
    titleLabel.text=@"Drinking Water Today";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=APP_NORMAL_FONT(12.0);
    titleLabel.textColor=[UIColor colorWithHexString:@"#9C9C9C"];
    [bgView addSubview:titleLabel];
    return bgView;
}

-(void)reloadHeaderView{
   
    NSUserDefaults  *  defaults=[NSUserDefaults standardUserDefaults];
    NSString   *  goal=[defaults objectForKey:@"waterTotal"];
   totalNum.text=[NSString stringWithFormat:@"%dml",[goal intValue]];
   startNum.text=[NSString stringWithFormat:@"%dml",[[defaults objectForKey:@"haveDrink"] intValue]];
   progress.progressValue=[NSString stringWithFormat:@"%f",[startNum.text doubleValue]/[goal doubleValue]];
    if ([totalNum.text intValue]==0) {
        prograssNum.text=@"0%";
    }else{
        prograssNum.text= [NSString stringWithFormat:@"%f%%",[startNum.text doubleValue]/[goal doubleValue]*100];
        
    }
//     prograssNum.text= [NSString stringWithFormat:@"%f%%",[startNum.text doubleValue]/[goal doubleValue]*100];
   if ([startNum.text doubleValue]/[goal doubleValue]*100>100) {
                   [self show];
    }
       
}
-(void)configUI{
    
    UIButton * addBtn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-87*KScaleW, SCREEN_HEIGHT-90*KScaleH, 51.5*KScaleW, 51.5*KScaleW)];
    [addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
}
-(void)add{
    NSUserDefaults * defaults=[NSUserDefaults standardUserDefaults];
    NSString  *   waterLabel=[defaults objectForKey:@"waterTotal"];
    if ([waterLabel intValue]==0) {
        GoalViewController   *  vc=[[GoalViewController alloc]init];
        [self.navigationController pushViewController:vc animated:NO];
        vc.returnBlock = ^{
            
             [self.tableView reloadData];
        };
    }else{
        EnterWaterViewController  *  vc=[[EnterWaterViewController alloc]init];
        vc.returnBlock = ^{
               NSString *home = NSHomeDirectory();
              NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
             NSString *filepath = [docPath stringByAppendingPathComponent:@"data.plist"];
            self.dataList=[NSMutableArray arrayWithContentsOfFile:filepath];
           [self.tableView reloadData];
//            [self reloadHeaderView];
           };
        [self.navigationController pushViewController:vc animated:NO];
    }
}

-(void)show
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    showview.center = self.view.center;
    showview.bounds = CGRectMake(0, 0, SCREEN_WIDTH*0.423, SCREEN_WIDTH*0.423);
    [window addSubview:showview];
    
    
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(0.35*showview.bounds.size.width, 0.226*showview.bounds.size.width, 0.296*showview.bounds.size.width, 0.283*showview.bounds.size.height);
    imageView.image = [UIImage imageNamed:@"icon_gift.png"];
    [showview addSubview:imageView];
    
    UILabel *expLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, showview.bounds.size.width-50, showview.bounds.size.width, 30)];
    expLabel.text =@"Goal achieved!";
    expLabel.textAlignment = NSTextAlignmentCenter;
    expLabel.textColor = [UIColor whiteColor];
    [showview addSubview:expLabel];
    
    [UIView animateWithDuration:5.0f animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
        NSMutableArray   *  data=[[NSMutableArray alloc] init];
        NSString *home = NSHomeDirectory();
        NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
        NSString *filepath = [docPath stringByAppendingPathComponent:@"data.plist"];
        data=[NSMutableArray arrayWithContentsOfFile:filepath];
        [self.dataList removeAllObjects];
        [self.dataList writeToFile:filepath atomically:YES];
        [self.tableView reloadData];
        NSUserDefaults  *  defaults=[NSUserDefaults standardUserDefaults];
        [defaults setObject:@"0" forKey:@"waterTotal"];
        [defaults setObject:@"0" forKey:@"haveDrink"];
        [self reloadHeaderView];
          
    }];
}
@end
