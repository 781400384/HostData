//
//  FeedBackViewController.m
//  News
//
//  Created by 纪明 on 2020/2/11.
//  Copyright © 2020 Superme. All rights reserved.
//

#import "FeedBackViewController.h"
#import "LYYTextView.h"
@interface FeedBackViewController ()<UITextViewDelegate>
@property (nonatomic, strong) LYYTextView *textView;
@end

@implementation FeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     id traget = self.navigationController.interactivePopGestureRecognizer.delegate;
       
        self.naviView.naviTitleLabel.text=@"FeedBack";
        self.naviView.rightTitleLabel.text=@"Submit";;
        self.naviView.rightTitleLabel.textColor=[UIColor colorWithHexString:@"#f4e0e7"];
         self.view.backgroundColor=RGB(247, 244, 249);
        
        UIView   *   bgView=[[UIView alloc]initWithFrame:CGRectMake(30*KScaleW,self.naviView.bottom+8*KScaleH, SCREEN_WIDTH-60*KScaleW, 227*KScaleH)];
        bgView.backgroundColor=[UIColor whiteColor];
         [bgView setRadius:32*KScaleW];
        [self.view addSubview:bgView];
       _textView = [[LYYTextView alloc]initWithFrame:CGRectMake(24*KScaleW,24*KScaleH, bgView.width-48*KScaleW, bgView.height-24*KScaleW)];
        _textView.placeholder = @"Please enter  you feedback!";
        _textView.backgroundColor=[UIColor whiteColor];
       
            //对齐
     
            //字体颜色
        _textView.textColor = [UIColor blackColor];
        [bgView addSubview:_textView];
    }

-(void)rightTitleLabelTap{
      
        [self.view toast:@"Thank you for your advice"];
           
}


@end
