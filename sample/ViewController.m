//
//  ViewController.m
//  sample
//
//  Created by 毕洪博 on 14-8-11.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableDictionary *   _dictM;//映射字典
    int                     _warFlag;//标记
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _dictM = [NSMutableDictionary dictionary];
    //设置所有warImage为隐藏
    [self setWarArrayHidden:YES];
    //设置代理
    self.textfield1.delegate = self;
    self.textField2.delegate = self;
    self.textField3.delegate = self;
    self.textField4.delegate = self;
    self.textVIew.delegate = self;
    //创建控件tag与warArray之间的关联
    [_dictM setObject:@(0) forKey:@(kWarTextField1)];
    [_dictM setObject:@(1) forKey:@(kWarTextField2)];
    [_dictM setObject:@(2) forKey:@(kWarTextField3)];
    [_dictM setObject:@(3) forKey:@(kWarTextField4)];
    [_dictM setObject:@(4) forKey:@(kWarTextView)];
    [_dictM setObject:@(5) forKey:@(kWarLabel)];
    //标记清空
    _warFlag = 0;
    
    
}
#pragma mark 设置所有叹号隐身状态
- (void) setWarArrayHidden:(BOOL) isHidden
{
    //设置所有叹号隐身
    for (UIImageView * imageView in _warArray)
        imageView.hidden = isHidden;
}
#pragma mark textField代理方法,结束编辑
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    //    int index2 = textField.superview.tag;
    int index = [_dictM[@(textField.tag)] intValue];
    
    if ([textField.text isEqualToString:@""])
        [_warArray[index] setHidden:NO];
    else
        [_warArray[index] setHidden:YES];
    
    [textField resignFirstResponder];
    return YES;
}
#pragma mark textView代理方法，结束编辑
-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    int index = [_dictM[@(textView.tag)] intValue];
    
    if ([textView.text isEqualToString:@""])
        [_warArray[index] setHidden:NO];
    else
        [_warArray[index] setHidden:YES];
    
    [textView resignFirstResponder];
    return YES;
}
#pragma mark tableView代理方法，监听cell选中事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
    if (indexPath.row == 6) {
        _textLabel.text =[_textLabel.text isEqualToString:@"未设置"]
        ? @"已设置" : @"未设置";
        UIImageView * imageView =_warArray[[_dictM[@(_textLabel.tag)] integerValue]];
        imageView.hidden =!imageView.hidden||!_warFlag++;//判断第一次点击
    }
}
#pragma mark 提交按钮
- (IBAction)postButtonClick:(id)sender {
    [self.view endEditing:YES];//先撤掉所有编辑焦点
    
    for (UIImageView * imageView in _warArray)
        if (!imageView.hidden || _warFlag == 0)//flag能够判断是否为第一次点击
            return;
    
    //恢复状态，可不做，以防万一写上
    [self setWarArrayHidden:YES];
    [[[UIAlertView alloc]initWithTitle:@"登录成功" message:@"恭喜你登录成功了！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
    
    
}
@end
