//
//  DrinkHistoryViewController.m
//  DrinkWater
//
//  Created by 纪明 on 2020/2/16.
//  Copyright © 2020 纪明. All rights reserved.
//

#import "DrinkHistoryViewController.h"
#import "MainTableViewCell.h"

@interface DrinkHistoryViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView   *     tableView;
@property (nonatomic, strong) NSMutableArray *    dataList;

@end

@implementation DrinkHistoryViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSString *home = NSHomeDirectory();
       NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
       NSString *filepath = [docPath stringByAppendingPathComponent:@"data.plist"];
       self.dataList=[NSMutableArray arrayWithContentsOfFile:filepath];
       NSLog(@"self=%@",self.dataList);
       [self.tableView reloadData];
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.naviView.naviTitleLabel.text=@"Drink History";
   
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, self.naviView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT-self.naviView.bottom) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.rowHeight=56*KScaleH;
        _tableView.backgroundColor=[UIColor whiteColor];
        _tableView.separatorColor=[UIColor clearColor];
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


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
  
        UIView  *   bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.1)];
        return bgView;
  
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
@end
