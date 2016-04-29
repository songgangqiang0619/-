//
//  BTContentCell.m
//  通讯录
//
//  Created by 宋钢强 on 16/4/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "BTContentCell.h"
#import "Models.h"
@implementation BTContentCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"cell";
    BTContentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        
//        cell = [[BTContentCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        
//        
//    }
    
    
    return cell;

}



-(void)setModel:(Models *)model{
    _model = model;
    self.textLabel.text = model.name;
    self.detailTextLabel.text = model.phoneNum;




}




@end
