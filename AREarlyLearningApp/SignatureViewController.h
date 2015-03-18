//
//  SignatureViewController.h
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 08/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJRSignatureView.h"
@interface SignatureViewController : UIViewController<UITextFieldDelegate>
{
  PJRSignatureView *signatureView;
    NSMutableDictionary *dictToSend;
    
}
@property(strong,nonatomic) NSArray *ArrData;
@property (weak, nonatomic) IBOutlet UIButton *btnClear;
- (IBAction)BtnClearClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;
- (IBAction)BtnSaveClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;
- (IBAction)BtnCancelClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *LblEmail;
@property(strong,nonatomic) NSDictionary *dicDonor;
@end
