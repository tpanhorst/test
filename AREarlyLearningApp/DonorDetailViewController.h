//
//  DonorDetailViewController.h
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 07/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DonateDataDelegate
@optional
-(void)presentEmailView;
-(void)presentSignatureView;
@end

@interface DonorDetailViewController : UIViewController
- (IBAction)BtnEmailClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnSignature;
- (IBAction)BtnSignatureClicked:(id)sender;
@property(nonatomic,retain) id<DonateDataDelegate>delegateDonate;
@property (weak, nonatomic) IBOutlet UIButton *btnEnterEmail;
@end
