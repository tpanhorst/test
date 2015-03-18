//
//  FormSheetViewController.h
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 04/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CategoryDelegate
@optional
-(void)ReloadTablFromOtherView:(NSDictionary *)dictCategory;
@end



@interface FormSheetViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *LblCategory;
@property (weak, nonatomic) IBOutlet UIButton *btnDonate;
- (IBAction)BtnDonateClicked:(id)sender;
@property(strong,nonatomic) NSString *StrCategory;
@property (weak, nonatomic) IBOutlet UITextField *TxtAmnt;
@property(nonatomic,retain) id<CategoryDelegate>categoryChange;
@property(strong,nonatomic) NSString *strProDescp;
@property(strong,nonatomic) NSDictionary *dicItem;
@end
