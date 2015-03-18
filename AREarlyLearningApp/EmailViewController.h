//
//  EmailViewController.h
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 08/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UIButton *btnSend;
- (IBAction)BtnSendClicked:(id)sender;

@end
