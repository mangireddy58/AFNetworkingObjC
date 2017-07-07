//
//  LoginViewController.m
//  ObjCDelegate
//
//  Created by Rushikesh Kulkarni on 07/07/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

#import "LoginViewController.h"
#import "ObjCClassForServerCommunication.h"

//#define LOGIN_REQUEST_PARAMS @"{\"user\": {\"email\": \"%@\",\"password\": \"%@\"},\"userPersonalDetails\": {\"iosId\":\"%@\"}}"

#define LOGIN_REQUEST_PARAMS @"{\"email\":\"%@\",\"password\":\"%@\",\"iosid\":\"%@\"}"

#define LOGIN_URL @"login"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (IBAction)loginBtnAction:(id)sender {
    [self.view endEditing:YES];
    if (self.emailTxtFld.text.length == 0){
        [self.emailTxtFld becomeFirstResponder];
    }
    else if (self.passwordTxtFld.text.length == 0){
        [self.passwordTxtFld becomeFirstResponder];
    }
//    else if(![self fnForValidateEmail:self.emailTxtFld.text]){
//        [self showGeneralAlert:NSLocalizedString(@"reg_email_invalid", nil)];
//    }
    else{
        NSString *deviceid = @"iosId";
        NSString *lLoginParams = [NSString stringWithFormat:LOGIN_REQUEST_PARAMS, self.emailTxtFld.text, self.passwordTxtFld.text,deviceid];
        ObjCClassForServerCommunication *objForServerComm = [[ObjCClassForServerCommunication alloc] init];
        objForServerComm.delegate = self;
        [objForServerComm sendHttpPostRequestWithParam:lLoginParams andServiceName:LOGIN_URL];
    }
}
-(void)onServiceSuccess:(NSDictionary *)responseDictionary{
    
    if((NSNull *)responseDictionary != [NSNull null]){
        @try {
            if([[responseDictionary objectForKey:@"success"] boolValue]){
                NSLog(@"responce dictionary = %@",responseDictionary);
            }else{
                NSLog(@"User invalid%@",[responseDictionary objectForKey:@"your reponse error kry"]);

            }
        } @catch (NSException *exception) {
            NSLog(@"Unable to process");
        }
    }
}
@end
