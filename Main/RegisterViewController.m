//
//  RegisterViewController.m
//  DrinkWater
//
//  Created by 纪明 on 2020/2/16.
//  Copyright © 2020 纪明. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField  *   phoneTf;
@property (nonatomic, strong) UITextField  *   pwdTF;
@property (nonatomic, strong) UITextField  *   confirmPwdTF;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.naviView.naviTitleLabel.text=@"Registered";
     [self configUI];
}
-(void)configUI{
    UIImageView   *   image=[[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-117.5*KScaleW)/2, self.naviView.bottom+20*KScaleW, 117.5*KScaleW, 119.5*KScaleH)];
    image.image=[UIImage imageNamed:@"icon"];
    image.contentMode=UIViewContentModeScaleToFill;
    image.clipsToBounds=YES;
    [self.view addSubview:image];
    
    
    for (int i=0; i<3; i++) {
        UITextField  *  tf=[[UITextField alloc]initWithFrame:CGRectMake(65*KScaleW, image.bottom+54*KScaleH+74.5*KScaleH*i, SCREEN_WIDTH-130*KScaleW, 64.5*KScaleH)];
        tf.delegate=self;
        [tf setRadius:10.0];
        tf.backgroundColor=[UIColor whiteColor];
        tf.placeholder=@[@"USERNAME",@"Your Password",@"PASSWORD AGAIN"][i];
        [self.view addSubview:tf];
        if (i==0) {
            self.phoneTf=tf;
        }else if(i==1){
            self.pwdTF=tf;
            tf.secureTextEntry=YES;
        }else{
            self.confirmPwdTF=tf;
            tf.secureTextEntry=YES;
        }
        UIView  *  lineView=[[UIView alloc]initWithFrame:CGRectMake(65*KScaleW, tf.bottom,  SCREEN_WIDTH-130*KScaleW, 1.5*KScaleH)];
        lineView.backgroundColor=[UIColor colorWithHexString:@"#D3D3D3"];
        [lineView setRadius:0.75*KScaleH];
        [self.view addSubview:lineView];
        
    }
    UIButton  *   loginBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-158.5*KScaleW)/2, self.confirmPwdTF.bottom+46.5*KScaleH, 158.5*KScaleW, 36*KScaleH)];
    [loginBtn setRadius:18.0];
    loginBtn.backgroundColor=APP_NAVI_COLOR;
    [loginBtn setTitle:@"Registered" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.titleLabel.font=APP_NORMAL_FONT(18.0);
    [self.view addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
   
}
-(void)login{
    if ([self.phoneTf.text isEmpty]) {
        [self.view toast:@"Account number cannot be empty"];
        return;
    }
    if ([self.pwdTF.text isEmpty]) {
        [self.view toast:@"Password cannot be empty"];
               return;
    }
    if ([self.confirmPwdTF.text isEmpty]) {
        [self.view toast:@"Password cannot be empty"];
               return;
    }
    [self.view toast:@"SUCCESS"];
    [self.navigationController popViewControllerAnimated:YES];
    NSUserDefaults  *  defaults=[NSUserDefaults  standardUserDefaults];
    [defaults setObject:self.phoneTf.text forKey:@"phone"];
    [defaults setObject:self.pwdTF.text forKey:@"pwd"];
}



@end
