//
//  GoalViewController.m
//  DrinkWater
//
//  Created by 纪明 on 2020/2/16.
//  Copyright © 2020 纪明. All rights reserved.
//

#import "GoalViewController.h"

@interface GoalViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField     *   tf;
@end

@implementation GoalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.naviView.naviTitleLabel.text=@"Drink Goal";
    [self confgUI];
}
-(void)confgUI{
    self.tf=[[UITextField alloc]initWithFrame:CGRectMake(25*KScaleW, self.naviView.bottom+45*KScaleW, SCREEN_WIDTH-25*KScaleH, 50*KScaleW)];
    self.tf.delegate=self;
    self.tf.placeholder=@"Please enter today's water target";
    self.tf.font=APP_NORMAL_FONT(15.0);
    self.tf.textColor=[UIColor colorWithHexString:@"#1F1F1F"];
    self.tf.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.tf];
    
    UIView   *   lineView=[[UIView alloc]initWithFrame:CGRectMake(25*KScaleW, self.tf.bottom, SCREEN_WIDTH-25*KScaleH, 1*KScaleH)];
   lineView.backgroundColor=[UIColor colorWithHexString:@"#E3E3E3"];
    [self.view addSubview:lineView];
    
    UILabel  *  titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, lineView.bottom+11.5*KScaleH, SCREEN_WIDTH, 26.5*KScaleH)];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=APP_NORMAL_FONT(36.0);
    titleLabel.text=@"ML";
    titleLabel.textColor=[UIColor colorWithHexString:@"#C4C1C1"];
    [self.view addSubview:titleLabel];
    
    UILabelSet  *  descLabel=[[UILabelSet alloc]initWithFrame:CGRectMake(31.5*KScaleW, titleLabel.bottom+59*KScaleH, SCREEN_WIDTH-63*KScaleW, 300*KScaleH)];
    descLabel.textAlignment=NSTextAlignmentLeft;
    descLabel.font=APP_NORMAL_FONT(12.0);
    descLabel.textColor=[UIColor colorWithHexString:@"#434346"];
    descLabel.numberOfLines=0;
    descLabel.text=@"A person should consume no less than 2000 ml of water a day, but the source of water can be drunk or obtained from the diet, so if the diet intakes more water, you can drink less water, otherwise you can drink more. Usually five or six cups a day is more appropriate. Other experts believe that it is more appropriate for the average person to drink 1500 ml of water a day. The human body's water accounts for 60% to 70% of the total weight of the human body. People can not eat for two months, but they will die from dehydration if they do not drink for a few days. Many people in the society are dehydrated. The human body's daily demand for water is generally 2000ml ~ 2500ml, and the food intake is 1000ml ~ 1500ml, so you usually need to drink 8 ~ 10 glasses of water to maintain balance. You should drink water during the day and night to maintain your health.";
    [self.view addSubview:descLabel];
    
    UIButton  *  btn=[[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-51*KScaleH, SCREEN_WIDTH, 51*KScaleH)];
    btn.backgroundColor=RGB(206, 206, 206);
    [btn setTitle:@"save" forState:UIControlStateNormal];
    btn.titleLabel.font=APP_NORMAL_FONT(18.0);
    [btn setTitleColor:APP_NAVI_COLOR forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
}
-(void)save{
    if ([self.tf.text isEmpty]) {
        [self.view toast:@"Please input the quantity of drinking water"];
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
    [self.view toast:@"Set up successfully"];
    NSUserDefaults * defaults=[NSUserDefaults standardUserDefaults];
    NSLog(@"aa==%@",self.tf.text);
    [defaults setObject:self.tf.text forKey:@"waterTotal"];
  if (self.returnBlock) {
      self.returnBlock();
  };
}
@end
