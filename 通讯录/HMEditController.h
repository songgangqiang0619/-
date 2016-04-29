//
//  HMEditController.h
//  通讯录
//
//  Created by 宋钢强 on 16/4/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Models,HMEditController;

@protocol HMEditControllerDelegate <NSObject>

@optional
-(void)editControllerDidSave:(HMEditController *)controller;

@end



@interface HMEditController : UIViewController
@property (nonatomic,strong) Models *editModel;
@property (nonatomic,strong) id <HMEditControllerDelegate > delegate;


@end
