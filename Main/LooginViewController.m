//
//  LooginViewController.m
//  DrinkWater
//
//  Created by 纪明 on 2020/2/16.
//  Copyright © 2020 纪明. All rights reserved.
//

#import "LooginViewController.h"
#import "RegisterViewController.h"
@interface LooginViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField  *   phoneTf;
@property (nonatomic, strong) UITextField  *   pwdTF;

@end

@implementation LooginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.naviView.naviTitleLabel.text=@"LOGIN";
    self.naviView.leftItemButton.hidden=YES;
    [self configUI];
    
}
-(void)configUI{
    UIImageView   *   image=[[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-117.5*KScaleW)/2, self.naviView.bottom+20*KScaleW, 117.5*KScaleW, 119.5*KScaleH)];
    image.image=[UIImage imageNamed:@"icon"];
    image.contentMode=UIViewContentModeScaleToFill;
    image.clipsToBounds=YES;
    [self.view addSubview:image];
    
    
    for (int i=0; i<2; i++) {
        UITextField  *  tf=[[UITextField alloc]initWithFrame:CGRectMake(65*KScaleW, image.bottom+54*KScaleH+74.5*KScaleH*i, SCREEN_WIDTH-130*KScaleW, 64.5*KScaleH)];
        tf.delegate=self;
        [tf setRadius:10.0];
        tf.backgroundColor=[UIColor whiteColor];
        tf.placeholder=@[@"USERNAME",@"Your Password"][i];
        [self.view addSubview:tf];
        if (i==0) {
            self.phoneTf=tf;
        }else{
            self.pwdTF=tf;
            tf.secureTextEntry=YES;
        }
        UIView  *  lineView=[[UIView alloc]initWithFrame:CGRectMake(65*KScaleW, tf.bottom,  SCREEN_WIDTH-130*KScaleW, 1.5*KScaleH)];
        lineView.backgroundColor=[UIColor colorWithHexString:@"#D3D3D3"];
        [lineView setRadius:0.75*KScaleH];
        [self.view addSubview:lineView];
        
    }
    UIButton  *   loginBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-158.5*KScaleW)/2, self.pwdTF.bottom+46.5*KScaleH, 158.5*KScaleW, 36*KScaleH)];
    [loginBtn setRadius:18.0];
    loginBtn.backgroundColor=APP_NAVI_COLOR;
    [loginBtn setTitle:@"LOGN" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.titleLabel.font=APP_NORMAL_FONT(18.0);
    [self.view addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton  *  regsterBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-158.5*KScaleW)/2, loginBtn.bottom, 158.5*KScaleW, 36*KScaleH)];
    regsterBtn.backgroundColor=[UIColor whiteColor];
    [regsterBtn setTitle:@"Registered" forState:UIControlStateNormal];
    [regsterBtn setTitleColor:[UIColor colorWithHexString:@"#8A8A8A"] forState:UIControlStateNormal];
    regsterBtn.titleLabel.font=APP_NORMAL_FONT(12.0);
    [self.view addSubview:regsterBtn];
    [regsterBtn addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)login{
    NSUserDefaults  *  defaults=[NSUserDefaults standardUserDefaults];
    if ([self.phoneTf.text isEmpty]||[self.phoneTf.text isEqualToString:[defaults objectForKey:@"phone"]]) {
        [self.view toast:@"Account number error, please re-enter"];
        return;
    }
    if ([self.pwdTF.text isEmpty]||[self.pwdTF.text isEqualToString:[defaults objectForKey:@"pwd"]]) {
        [self.view toast:@"Wrong password, please re-enter"];
        return;
    }
    __weak typeof(self)weakSelf = self;
         weakSelf.loginSuccessBlock();
}
-(void)registerClick{
    RegisterViewController  *  vc=[[RegisterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
