//
//  MainTableViewCell.h
//  DrinkWater
//
//  Created by 纪明 on 2020/2/16.
//  Copyright © 2020 纪明. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView    *     typeImg;
@property (nonatomic, strong) UILabel        *     timeLabel;
@property (nonatomic, strong) UILabel        *     waterLabel;
@property (nonatomic, strong) UIView        *     lineView;
@end

NS_ASSUME_NONNULL_END
