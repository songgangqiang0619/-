//
//  HMAddController.m
//  通讯录
//
//  Created by 宋钢强 on 16/4/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "HMAddController.h"
#import "Models.h"



@interface HMAddController ()

@property (weak, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UITextField *phoneName;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;




@end

@implementation HMAddController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.name addTarget:self action:@selector(textFieldClick) forControlEvents:UIControlEventEditingChanged];
    [self.phoneName addTarget:self action:@selector(textFieldClick)  forControlEvents:UIControlEventEditingChanged ];
    
    
    [self.addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];

 


}


-(void)addBtnClick{

//获取文本框的内容
    NSString *name = self.name.text;
    NSString *phoneNum = self.phoneName.text;
    
//    转换成模型
    Models *model = [Models contactWithName:name andPhoneNum:phoneNum];

////    listvc中添加
//    if ([self.delegate respondsToSelector:@selector(addController:AddContact:)]) {
//        [self.delegate addController:self AddContact:model];
//    }
    
    if ([self.delegate respondsToSelector:@selector(addControllerAddContact:)]) {
                [self.delegate addControllerAddContact:model];
            }
    
//    刷新

    [self.navigationController popViewControllerAnimated:YES];


}
-(void)textFieldClick{
    NSString *name = self.name.text;
    NSString *phoneName = self.phoneName.text;
    
    if (name.length > 0&& phoneName.length > 0) {
        
        self.addBtn.enabled = YES;
    }else{
    
        self.addBtn.enabled = NO;
    }
}

@end
