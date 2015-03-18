//
//  PassWordViewController.h
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 02/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface PassWordViewController : UIViewController
{
    MBProgressHUD *HUD;
}
@property (weak, nonatomic) IBOutlet UITextField *TxtPassCode;
@property (weak, nonatomic) IBOutlet UIButton *btnEnter;

- (IBAction)BtnEnterClicked:(id)sender;

@end
