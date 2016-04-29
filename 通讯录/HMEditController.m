//
//  HMEditController.m
//  通讯录
//
//  Created by 宋钢强 on 16/4/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "HMEditController.h"
#import "Models.h"


@interface HMEditController ()

@property (weak, nonatomic) IBOutlet UITextField *nameLbl;

@property (weak, nonatomic) IBOutlet UITextField *phoneLbl;



@property (weak, nonatomic) IBOutlet UIButton *clickBtn;

@end

@implementation HMEditController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
//    self.editModel
    self.nameLbl.text = self.editModel.name;
    self.phoneLbl.text = self.editModel.phoneNum;
    
    
    [self.clickBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)saveBtnClick{

//修改模型数据
    self.editModel.name = self.nameLbl.text;
    self.editModel.phoneNum = self.phoneLbl.text;
    
    
//    刷新列表
    if ([self.delegate respondsToSelector:@selector(editControllerDidSave:)]) {
        [self.delegate editControllerDidSave:self];
    }
    
    
//    pop

    [self.navigationController popViewControllerAnimated:YES];


}




//点击编辑按钮
- (IBAction)editBtnClick:(UIBarButtonItem *)sender {
    if ([sender.title isEqualToString:@"编辑"]) {
        sender.title = @"取消";
        
        
        self.nameLbl.enabled = YES;
        self.phoneLbl.enabled = YES;
        
        
        self.clickBtn.hidden = NO;
        
        
        [self.phoneLbl becomeFirstResponder];
        
        
        
    }else{
    sender.title = @"编辑";
        self.nameLbl.enabled = NO;
        self.phoneLbl.enabled = NO;
        
        self.clickBtn.hidden = YES;
    
        self.nameLbl.text = self.editModel.name;
        self.phoneLbl.text = self.editModel.phoneNum;
    
    }
    
    
    
    
}



@end
