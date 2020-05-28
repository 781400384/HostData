//
//  NaviView.h
//  ReadBook
//
//  Created by Superme on 2019/10/29.
//  Copyright © 2019 Superme. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NaviView : UIView
@property (nonatomic, strong) UIButton         *            leftItemButton;
@property (nonatomic, strong) UIButton         *            rightItemButton;
@property (nonatomic, strong) UILabel          *            naviTitleLabel;
@property (nonatomic, strong) UIImageView      *            image;
@property (nonatomic, strong) UILabel          *            rightTitleLabel;

@property (nonatomic, strong) UIView           *            line;
@end

NS_ASSUME_NONNULL_END
