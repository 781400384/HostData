//
//  NaviView.m
//  ReadBook
//
//  Created by Superme on 2019/10/29.
//  Copyright © 2019 Superme. All rights reserved.
//

#import "NaviView.h"

@implementation NaviView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
    [self addSubview:self.leftItemButton];
    [self addSubview:self.naviTitleLabel];
    [self addSubview:self.rightItemButton];
    [self addSubview:self.rightTitleLabel];
    
    [self.rightTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(@(-15*KScaleW));
        make.centerY.equalTo(self.naviTitleLabel);
    }];
  
    
}

- (UIButton *)leftItemButton {
    
    if (!_leftItemButton) {
        CGFloat y = IS_X ? NAVI_SUBVIEW_Y_iphoneX : NAVI_SUBVIEW_Y_Normal;
        _leftItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftItemButton.frame = CGRectMake(0, y, 60, self.height-y);
        _leftItemButton.titleLabel.font = [UIFont systemFontOfSize:18*KScaleW];
        [_leftItemButton setImage:[UIImage imageNamed:@"navi_back"] forState:UIControlStateNormal];
        [_leftItemButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _leftItemButton;
}
- (UIButton *)rightItemButton {
    
    if (!_rightItemButton) {
        CGFloat y = IS_X ? NAVI_SUBVIEW_Y_iphoneX : NAVI_SUBVIEW_Y_Normal;
        _rightItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightItemButton.frame = CGRectMake(SCREEN_WIDTH-70, y, 65, self.height-y);
        _rightItemButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_rightItemButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _rightItemButton;
}

- (UILabel *)rightTitleLabel {
    
    if (!_rightTitleLabel) {
        _rightTitleLabel = [[UILabel alloc]init];
        _rightTitleLabel.font = [UIFont systemFontOfSize:18*KScaleW];
        _rightTitleLabel.textAlignment = NSTextAlignmentRight;
        [_rightTitleLabel sizeToFit];
        _rightTitleLabel.userInteractionEnabled = YES;
    }
    return _rightTitleLabel;
}

- (UILabel *)naviTitleLabel {
    
    if (!_naviTitleLabel) {
        
        CGFloat y = IS_X ? NAVI_SUBVIEW_Y_iphoneX : NAVI_SUBVIEW_Y_Normal;
        _naviTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.leftItemButton.right+10, y, SCREEN_WIDTH-self.leftItemButton.width*2-10*2, self.height-y)];
        _naviTitleLabel.textAlignment = NSTextAlignmentCenter;
        _naviTitleLabel.textColor = [UIColor whiteColor];
        _naviTitleLabel.font = [UIFont systemFontOfSize:18.0];
    }
    return _naviTitleLabel;
}


@end
