//
//  BTContentCell.h
//  通讯录
//
//  Created by 宋钢强 on 16/4/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Models;

@interface BTContentCell : UITableViewCell

@property (nonatomic,strong)Models *model;


+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
