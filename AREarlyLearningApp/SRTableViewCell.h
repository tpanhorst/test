//
//  SRTableViewCell.h
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 03/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SRTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *LblTblDetails;
- (IBAction)BtnAddClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *LblValue;
- (IBAction)BtnMinusClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *LblDollOne;
@property (weak, nonatomic) IBOutlet UILabel *LblDollTwo;
@property (weak, nonatomic) IBOutlet UIButton *btnMinus;

@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@end
