//
//  MainTableViewCell.m
//  DrinkWater
//
//  Created by 纪明 on 2020/2/16.
//  Copyright © 2020 纪明. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

-(void)layoutSubviews{
    [self addSubview:self.typeImg];
    [self.typeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22.5*KScaleW);
        make.top.mas_equalTo(10*KScaleH);
    }];
    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.typeImg.mas_right).offset(11*KScaleW);
        make.top.mas_equalTo(15*KScaleH);
    }];
    [self addSubview:self.waterLabel];
    [self.waterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-22*KScaleW);
        make.top.mas_equalTo(15*KScaleH);
    }];
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(0.5*KScaleH);
    }];
}
-(UIImageView *)typeImg{
    if (!_typeImg) {
        _typeImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"water"]];
        _typeImg.contentMode=UIViewContentModeScaleAspectFit;
        _typeImg.clipsToBounds=YES;
    }
    return _typeImg;
}
-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel=[[UILabel alloc]init];
        _timeLabel.textAlignment=NSTextAlignmentCenter;
        _timeLabel.font=APP_NORMAL_FONT(15.0);
        _timeLabel.textColor=[UIColor colorWithHexString:@"#323232"];
        _timeLabel.text=@"1:00  pm";
    }
    return _timeLabel;
}
-(UILabel *)waterLabel{
    if (!_waterLabel) {
        _waterLabel=[[UILabel alloc]init];
        _waterLabel.textAlignment=NSTextAlignmentCenter;
        _waterLabel.font=APP_NORMAL_FONT(15.0);
        _waterLabel.textColor=[UIColor colorWithHexString:@"#323232"];
        _waterLabel.text=@"500ML";
    }
    return _waterLabel;
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView=[[UIView alloc]init];
        _lineView.backgroundColor=[UIColor colorWithHexString:@"#E3E3E3"];
    }
    return _lineView;
}
@end
