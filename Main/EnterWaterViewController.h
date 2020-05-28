//
//  EnterWaterViewController.h
//  DrinkWater
//
//  Created by 纪明 on 2020/2/16.
//  Copyright © 2020 纪明. All rights reserved.
//

#import "BaseViewController.h"
typedef void (^ReturnBlock)();
NS_ASSUME_NONNULL_BEGIN

@interface EnterWaterViewController : BaseViewController
@property(nonatomic, copy) ReturnBlock returnBlock;
@end

NS_ASSUME_NONNULL_END
