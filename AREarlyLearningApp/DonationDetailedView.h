//
//  DonationDetailedView.h
//  AREarlyLearningApp
//
//  Created by HIWORTH2 on 3/5/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DonationDetailedView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *ImgDonate;
@property (weak, nonatomic) IBOutlet UILabel *LblDonateDetails;
@property (weak, nonatomic) IBOutlet UILabel *LblQty;
@property (weak, nonatomic) IBOutlet UILabel *LblDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UILabel *LblValue;
@property (weak, nonatomic) IBOutlet UIButton *btnMinus;
@property (weak, nonatomic) IBOutlet UITextView *TxtSplReqst;
@property (weak, nonatomic) IBOutlet UIButton *btnOverRidePriice;

@end
