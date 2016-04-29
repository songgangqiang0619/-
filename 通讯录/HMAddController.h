//
//  HMAddController.h
//  通讯录
//
//  Created by 宋钢强 on 16/4/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMAddController,Models;

@protocol HMAddControllerDelegate <NSObject>
@optional

//-(void)addController:(HMAddController *)accVc AddContact:(Models *)addCt;
-(void)addControllerAddContact:(Models *)addCt;

@end

@interface HMAddController : UIViewController

@property (nonatomic,weak) id<HMAddControllerDelegate> delegate;

@end
