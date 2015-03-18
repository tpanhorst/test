//
//  DonationDetailedView.m
//  AREarlyLearningApp
//
//  Created by HIWORTH2 on 3/5/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import "DonationDetailedView.h"

@implementation DonationDetailedView
@synthesize LblDescription,LblDonateDetails,LblQty,LblValue,btnAdd,btnMinus,TxtSplReqst,btnOverRidePriice;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    TxtSplReqst.layer.borderColor=[UIColor whiteColor].CGColor;
    TxtSplReqst.layer.borderWidth=1.0;
    TxtSplReqst.layer.cornerRadius=8.0;
    btnOverRidePriice.layer.borderColor=[UIColor whiteColor].CGColor;
    btnOverRidePriice.layer.borderWidth=1.0;
    btnOverRidePriice.layer.cornerRadius=16.0;
    
    // Drawing code
}


@end
