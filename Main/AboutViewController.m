//
//  AboutViewController.m
//  News
//
//  Created by 纪明 on 2020/2/11.
//  Copyright © 2020 Superme. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
      self.naviView.naviTitleLabel.text=@"ABout";
}

-(void)configUI{
    UIImageView  *  image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon"]];
    image.frame=CGRectMake((SCREEN_WIDTH-153*KScaleW)/2, self.naviView.bottom+60*KScaleH, 153*KScaleW, 153*KScaleW);
    image.clipsToBounds=YES;
    [image setRadius:10.0*KScaleW];
    image.contentMode=UIViewContentModeScaleToFill;
    [self.view addSubview:image];
    
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(0, image.bottom+42*KScaleH, SCREEN_WIDTH, 15*KScaleH)];
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:15*KScaleW];
    label.text=[NSString stringWithFormat:@"Drinking Assistant v1.0.0"];
    [self.view addSubview:label];
}
@end
