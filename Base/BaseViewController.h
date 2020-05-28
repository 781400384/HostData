//
//  BaseViewController.h
//  ReadBook
//
//  Created by Superme on 2019/10/29.
//  Copyright © 2019 Superme. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
@property (nonatomic, strong) NaviView    *  naviView;
- (void)showLeftItemButton:(BOOL)show;
- (void)showRightItemButton:(BOOL)show;
- (void)leftDismiss;
- (void)rightTitleLabelTap;
@end

NS_ASSUME_NONNULL_END
