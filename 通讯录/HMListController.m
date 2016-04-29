//
//  HMListController.m
//  通讯录
//
//  Created by 宋钢强 on 16/4/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "HMListController.h"
#import "Models.h"
#import "BTContentCell.h"
#import "HMAddController.h"
#import "HMEditController.h"


@interface HMListController () <HMAddControllerDelegate,HMEditControllerDelegate>
@property (nonatomic,strong) NSMutableArray *arrModel;
@end

@implementation HMListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   
    if ([segue.identifier isEqualToString:@"ADD"]) {
        HMAddController *addVc = segue.destinationViewController;
        
        addVc.delegate = self;
        
    }else if ([segue.identifier isEqualToString:@"EDIT"]){
        
        
//        获取目标控制器
        HMEditController *editVc = segue.destinationViewController;
        
        
        editVc.delegate = self;
        
        
//        选中行的索引
        NSIndexPath *indexpath = [self.tableView indexPathForSelectedRow];
        
//        选中行的数据
        Models *model = self.arrModel[indexpath.row];
        
        editVc.editModel = model;
        
    
    }
    



}


#pragma mark - 通过垃圾桶删除
- (IBAction)trashClick:(id)sender {
    
    self.tableView.editing =!self.tableView.isEditing;
    
}


//编译的协议方法

-(void)editControllerDidSave:(HMEditController *)controller{
    [self.tableView reloadData];

}
#pragma mark - 向左滑动删除

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.arrModel removeObjectAtIndex:indexPath.row];
    
    [self.tableView reloadData];

}


-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
    
    
}



//实现协议方法
//-(void)addController:(HMAddController *)accVc AddContact:(Models *)addCt{
////    NSLog(@"%@",addCt.name);
//    [self.arrModel addObject:addCt];
//
//    [self.tableView reloadData];
//    
//
//
//
//
//}
-(void)addControllerAddContact:(Models *)addCt{
    [self.arrModel addObject:addCt];
    
        [self.tableView reloadData];



}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.arrModel.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    BTContentCell *cell = [BTContentCell cellWithTableView:tableView];
    
    cell.model = self.arrModel[indexPath.row];
    
    return cell;


}


# pragma mark  - 懒加载
-(NSMutableArray *)arrModel{

    if (_arrModel == nil) {
        
        NSMutableArray *arrM = [NSMutableArray array];
        Models *model = [Models contactWithName:@"zhangsan" andPhoneNum:@"15226197189"];
        Models *model1 = [Models contactWithName:@"lisi" andPhoneNum:@"1828384888"];
        [arrM addObject:model];
        [arrM addObject:model1];
        _arrModel = arrM;
        
    }

    return _arrModel;


}




#pragma mark -创建提醒框
- (IBAction)signOut:(id)sender {
    
//    创建提醒框
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定注销吗" preferredStyle:UIAlertControllerStyleActionSheet];
//    创建注销按钮
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"注销" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
        
    }];
    
// 创建取消按钮
    
    UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    
//    把注销和取消按钮添加到提醒框
    [controller addAction:action];
    [controller addAction:cancelBtn];
    
//    让提醒框显示出来
    [self presentViewController:controller animated:YES completion:nil];
    

    
}








@end
