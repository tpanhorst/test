//
//  FormSheetViewController.m
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 04/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import "FormSheetViewController.h"
#import "LNNumberpad.h"
@interface FormSheetViewController ()

@end

@implementation FormSheetViewController
@synthesize StrCategory,categoryChange,strProDescp,dicItem;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [_LblCategory setText:StrCategory];
   // _TxtAmnt.inputView=[LNNumberpad defaultLNNumberpad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)BtnDonateClicked:(id)sender
{
    NSMutableDictionary *dictValCate=[[NSMutableDictionary alloc]init];
    [dictValCate setObject:[dicItem objectForKey:@"item_id"] forKey:@"item_id"];
    [dictValCate setObject:strProDescp forKey:@"TblMaincontent"];
    [dictValCate setObject:@"1" forKey:@"value"];
    [dictValCate setObject:_TxtAmnt.text forKey:@"dollOne"];
    [dictValCate setObject:_TxtAmnt.text forKey:@"dollTwo"];
    if (self.categoryChange)
        [categoryChange ReloadTablFromOtherView:dictValCate];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
@end
