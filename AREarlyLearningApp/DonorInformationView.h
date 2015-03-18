//
//  DonorInformationView.h
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 09/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DonorInformationView : UIView
@property (weak, nonatomic) IBOutlet UILabel *LblName;
@property (weak, nonatomic) IBOutlet UILabel *LblDonatedDate;
@property (weak, nonatomic) IBOutlet UILabel *LblStreet;
@property (weak, nonatomic) IBOutlet UILabel *LblState;
@property (weak, nonatomic) IBOutlet UILabel *LblPin;
@property (weak, nonatomic) IBOutlet UILabel *LblCntry;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UIButton *btnDonorSelect;

@property (weak, nonatomic) IBOutlet UILabel *LblCellNum;
@end
