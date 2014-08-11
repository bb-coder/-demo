//
//  ViewController.h
//  sample
//
//  Created by 毕洪博 on 14-8-11.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{//绑定各控件tag枚举
    kWarTextField1 = 101,
    kWarTextField2 = 105,
    kWarTextField3 = 109,
    kWarTextField4 = 200,
    kWarTextView = 205,
    kWarLabel = 300
}kWarName;

@interface ViewController : UITableViewController<UITextFieldDelegate,UITextViewDelegate>
- (IBAction)postButtonClick:(id)sender;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *warArray;//叹号图片
@property (weak, nonatomic) IBOutlet UITextField                      *textfield1;//4个输入框
@property (weak, nonatomic) IBOutlet UITextField                      *textField2;
@property (weak, nonatomic) IBOutlet UITextField                      *textField3;
@property (weak, nonatomic) IBOutlet UITextField                      *textField4;
@property (weak, nonatomic) IBOutlet UITextView                       *textVIew;//1个输入域
@property (weak, nonatomic) IBOutlet UILabel                          *textLabel;//1个标签

@end
