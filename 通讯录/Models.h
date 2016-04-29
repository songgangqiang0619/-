//
//  Models.h
//  通讯录
//
//  Created by 宋钢强 on 16/4/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Models : NSObject
@property (nonatomic,copy)NSString *name;

@property (nonatomic,copy)NSString *phoneNum;

+(instancetype)contactWithName:(NSString *)name andPhoneNum:(NSString *)phoneNum;

@end
