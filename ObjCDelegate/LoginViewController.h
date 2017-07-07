//
//  LoginViewController.h
//  ObjCDelegate
//
//  Created by Rushikesh Kulkarni on 07/07/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjCClassForServerCommunication.h"

@interface LoginViewController : UIViewController<ClassForServerCommDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailTxtFld;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxtFld;
- (IBAction)loginBtnAction:(id)sender;

@end
