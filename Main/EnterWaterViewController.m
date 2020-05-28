//
//  EnterWaterViewController.m
//  DrinkWater
//
//  Created by 纪明 on 2020/2/16.
//  Copyright © 2020 纪明. All rights reserved.
//

#import "EnterWaterViewController.h"

@interface EnterWaterViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField   *   waterTF;
@property (nonatomic, strong) UITextField   *   coffeeTF;
@property (nonatomic, strong) UITextField   *   milkTF;
@property (nonatomic, strong) UITextField   *   oterTF;
@property (nonatomic, strong) UILabel       *   numLabel;
@property (nonatomic, copy)   NSString      *   type;
@property (nonatomic, copy)   NSString      *   waterNum;
@end

@implementation EnterWaterViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.naviView.hidden=YES;
    [self configUI];
}
-(void)configUI{
    UIView  *  bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 147.5*KScaleH)];
    bgView.backgroundColor=APP_NAVI_COLOR;
    bgView.userInteractionEnabled=YES;
    bgView.clipsToBounds=YES;
    [self.view addSubview:bgView];
    UIButton  *  closeBtn=[[UIButton alloc]initWithFrame:CGRectMake(11.5*KScaleW, IS_X?NAVI_SUBVIEW_Y_iphoneX:NAVI_SUBVIEW_Y_Normal, 17.5*KScaleW, 17.5*KScaleW)];
    [closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:closeBtn];
    UIButton  *  doneBtn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-51.5*KScaleW, IS_X?NAVI_SUBVIEW_Y_iphoneX:NAVI_SUBVIEW_Y_Normal, 40*KScaleW, 17.5*KScaleW)];
    doneBtn.titleLabel.font=[UIFont systemFontOfSize:15.0];
      [doneBtn setTitle:@"Done" forState:UIControlStateNormal];
      [doneBtn addTarget:self action:@selector(done) forControlEvents:UIControlEventTouchUpInside];
      [bgView addSubview:doneBtn];
    
    UILabel  *   timeLabel=[[UILabel alloc]initWithFrame:CGRectMake(50*KScaleW, IS_X?NAVI_SUBVIEW_Y_iphoneX:NAVI_SUBVIEW_Y_Normal, SCREEN_WIDTH-100*KScaleW, 14*KScaleH)];
    timeLabel.textColor=[UIColor whiteColor];
    timeLabel.textAlignment=NSTextAlignmentCenter;
    timeLabel.font=APP_BOLD_FONT(18.0);
    [self.view addSubview:timeLabel];
    NSDate *date = [NSDate date];
       NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
       [formatter setDateFormat:@"HH:mm"];
       timeLabel.text = [formatter stringFromDate:date];
    self.numLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, timeLabel.bottom+43*KScaleH, SCREEN_WIDTH, 27.5*KScaleH)];
    self.numLabel.text=@"0ML";
    self.numLabel.font=APP_BOLD_FONT(36.0);
    self.numLabel.textColor=[UIColor whiteColor];
    self.numLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:self.numLabel];
    for (int i=0; i<4; i++) {
        UITextField  *   tf=[[UITextField alloc]initWithFrame:CGRectMake(70*KScaleW, bgView.bottom+19*KScaleH+49*KScaleH*i, SCREEN_WIDTH-140*KScaleW, 33*KScaleH)];
        tf.backgroundColor=[UIColor whiteColor];
        tf.delegate=self;
        tf.keyboardType=UIKeyboardTypeNumberPad;
        [tf addTarget:self action:@selector(textLengthChanged:) forControlEvents:UIControlEventEditingChanged];
        [self.view addSubview:tf];
        tf.returnKeyType = UIReturnKeyDone;
        if (i==0) {
            self.waterTF=tf;
        }else if(i==1){
            self.coffeeTF=tf;
        }else if(i==2){
            self.milkTF=tf;
        }else{
            self.oterTF=tf;
        }
        UIView  *  lineView=[[UIView alloc]initWithFrame:CGRectMake(0, tf.bottom+15.5*KScaleH, SCREEN_WIDTH, 0.5*KScaleH)];
        lineView.backgroundColor=[UIColor colorWithHexString:@"#E6E6E6"];
        [self.view addSubview:lineView];
        
        UIImageView  *   iconImg=[[UIImageView alloc]initWithFrame:CGRectMake(36*KScaleW, tf.centerY-13.5*KScaleH, 24*KScaleW, 27*KScaleH)];
        iconImg.contentMode=UIViewContentModeScaleAspectFit;
        NSArray  *  arr=@[@"water",@"coffee",@"milk",@"other"];
        iconImg.image=[UIImage imageNamed:arr[i]];
        [self.view addSubview:iconImg];
        
        UILabel  *   label=[[UILabel alloc]initWithFrame:CGRectMake(tf.right+10*KScaleW, tf.centerY-6.5*KScaleH, SCREEN_WIDTH-tf.right-10*KScaleW, 13*KScaleH)];
        label.textAlignment=NSTextAlignmentLeft;
        label.font=APP_NORMAL_FONT(18.0);
        label.textColor=[UIColor colorWithHexString:@"#424242"];
        label.text=@[@"Water",@"Coffee",@"Milk",@"Other"][i];
        [self.view addSubview:label];
    }
    
}
-(void)close{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)textLengthChanged:(UITextField *)tf {
    if (self.waterTF==tf) {
         self.numLabel.text=[NSString stringWithFormat:@"%@ML",tf.text];
        self.coffeeTF.text=@"";
        self.milkTF.text=@"";
        self.oterTF.text=@"";
        self.type=@"water";
        self.waterNum=self.waterTF.text;
    }
    if (self.coffeeTF==tf) {
          self.numLabel.text=[NSString stringWithFormat:@"%@ML",tf.text];
          self.waterTF.text=@"";
          self.milkTF.text=@"";
          self.oterTF.text=@"";
         self.type=@"coffee";
         self.waterNum=self.coffeeTF.text;
        
    }
    if (self.milkTF==tf) {
         self.numLabel.text=[NSString stringWithFormat:@"%@ML",tf.text];
        self.waterTF.text=@"";
        self.coffeeTF.text=@"";
        self.oterTF.text=@"";
         self.type=@"milk";
        self.waterNum=self.milkTF.text;
    }
    if (self.oterTF==tf) {
         self.numLabel.text=[NSString stringWithFormat:@"%@ML",tf.text];
         self.waterTF.text=@"";
         self.coffeeTF.text=@"";
         self.milkTF.text=@"";
         self.type=@"other";
        self.waterNum=self.oterTF.text;
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.waterTF==textField) {
         NSLog(@"点击水");
    }
    if (self.coffeeTF==textField) {
     NSLog(@"点击了咖啡");
    }
    if (self.milkTF==textField) {
        NSLog(@"点击了j牛奶");
    }
    if (self.oterTF==textField) {
         NSLog(@"点击了其他");
    }
    [self dismissViewControllerAnimated:YES completion:nil];

      return YES;

}
-(void)done{
    if ([self.waterNum intValue]==0) {
        [self.view toast:@"You haven't entered anything yet"];
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
        NSString *home = NSHomeDirectory();
        NSDate *date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"hh:mm tt"];
    
    NSDateFormatter   *   MATTER=[[ NSDateFormatter alloc] init];
    [MATTER setDateFormat:@"yyyy-MMMM-dd"];
        NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSDictionary  *   dic=@{@"num":self.waterNum,@"type":self.type,@"time":[formatter stringFromDate:date],@"date":[MATTER stringFromDate:date]};
        NSString *filepath = [docPath stringByAppendingPathComponent:@"data.plist"];
    
   
     NSMutableArray   *     data1=[NSMutableArray arrayWithContentsOfFile:filepath];
    if (data1.count==0) {
              NSMutableArray   *  data=[[NSMutableArray alloc] init];
               [data addObject:dic];
               [data writeToFile:filepath atomically:YES];
          }else{
              [data1 addObject:dic];
              [data1 writeToFile:filepath atomically:YES];
          }
    if (self.returnBlock) {
           self.returnBlock();
       };
    NSLog(@"%@",self.waterNum);
    NSUserDefaults  * defaults=[NSUserDefaults standardUserDefaults];
    NSString  *  str=[defaults objectForKey:@"haveDrink"];
    NSString  *  all=[NSString stringWithFormat:@"%d",[str intValue]+[self.waterNum intValue]];
    [defaults setObject:all forKey:@"haveDrink"];
}

@end
