//
//  Models.m
//  通讯录
//
//  Created by 宋钢强 on 16/4/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "Models.h"

@implementation Models
+(instancetype)contactWithName:(NSString *)name andPhoneNum:(NSString *)phoneNum{
    Models *model = [[Models alloc]init];
    model.name = name;
    model.phoneNum = phoneNum;

    return model;

}


@end
