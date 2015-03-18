//
//  PassWordViewController.m
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 02/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import "PassWordViewController.h"
#import "BFPaperButton.h"
#import "UIColor+BFPaperColors.h"
#import "DashBoardViewController.h"
#import "LNNumberpad.h"
#import "SRUtility.h"
@interface PassWordViewController ()

@end

@implementation PassWordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSData *dataCategory=[SRUtility getdatafromplist:@"Categories" plist:@"Data"];
    NSUInteger categoryLength=[dataCategory length];
    if (categoryLength==0)
      [self InitdataCategory];
    NSData *dataSubCategory=[SRUtility getdatafromplist:@"SubCategories" plist:@"Data"];
    NSUInteger SubCategoryLength=[dataSubCategory length];
    if (SubCategoryLength==0)
        [self InitdataSubcategory];
    
    NSData *dataItems=[SRUtility getdatafromplist:@"Items" plist:@"Data"];
    NSUInteger dataItemsLenghth=[dataItems length];
    if ( dataItemsLenghth==0)
          [self InitDataItems];
    
    NSData *dataDonors=[SRUtility getdatafromplist:@"Donors" plist:@"Data"];
    NSUInteger dataDonorLength=[dataDonors length];
    if (dataDonorLength==0)
        [self InitDonorData];
        
    
    
   // [self InitdataCategory];
    BFPaperButton *bfFlatSmart = [[BFPaperButton alloc] initWithFrame:CGRectMake(389, 551, 257, 40) raised:NO];
    [bfFlatSmart setTitle:@"Enter" forState:UIControlStateNormal];
    [bfFlatSmart setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    bfFlatSmart.backgroundColor=[UIColor paperColorBrown400];
    bfFlatSmart.layer.cornerRadius=8.0;
    bfFlatSmart.layer.borderWidth=1.0;
    [bfFlatSmart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bfFlatSmart setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [bfFlatSmart addTarget:self action:@selector(EnterPassCode) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:bfFlatSmart];
   // _TxtPassCode.inputView=[LNNumberpad defaultLNNumberpad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
-(void)EnterPassCode
{
    NSUserDefaults *Prefs=[NSUserDefaults standardUserDefaults];
    NSString *StrPasS=[Prefs objectForKey:@"PassCode"];
    if ([_TxtPassCode.text isEqualToString:StrPasS])
    {
        DashBoardViewController *ObjDash=[self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
        [self.navigationController pushViewController:ObjDash animated:YES];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"AREarlyLearning" message:@"Congrats!! You Have successfully Logged In" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"AREarlyLearning" message:@"The PassCode You Entered is Wrong" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [Alert show];
    }
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [self.view endEditing:YES];
    return YES;
}


- (void)keyboardDidShow:(NSNotification *)notification
{
    // Assign new frame to your view
    [self.view setFrame:CGRectMake(0,-180,1024,714)]; //here taken -20 for example i.e. your view will be scrolled to -20. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,0,1024,714)];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)InitdataCategory
{   __block NSDictionary *dciWebresponse;
    HUD=[[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText=@"Please Wait Loading Master Data";
    [HUD showAnimated:YES whileExecutingBlock:^(void)
     {
         NSString *Strurl=@"http://aceonetest.com/webservice/index.php?request=categories";
         NSURL *TheUrl=[NSURL URLWithString:Strurl];
         dciWebresponse=[SRUtility makeWebServicecallForGetmethod:TheUrl];
     }
      completionBlock:^(void)
     {   if ([[dciWebresponse objectForKey:@"status_message"] isEqualToString:@"success"])
         {   NSData *data=[NSKeyedArchiver archivedDataWithRootObject:dciWebresponse];
             [SRUtility adddatatoplist:data key:@"Categories" plist:@"Data"];
         }
      }];
}
-(void)InitdataSubcategory
{
    __block NSDictionary *dicWebresponse;
    HUD=[[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText=@"Please Wait Loading Master Data";
    [HUD showAnimated:YES whileExecutingBlock:^(void)
     { NSString *StrUrl=@"http://aceonetest.com/webservice/index.php?request=subcategories";
         NSURL *TheUrl=[NSURL URLWithString:StrUrl];
         dicWebresponse=[SRUtility makeWebServicecallForGetmethod:TheUrl];
     }
      completionBlock:^(void)
     { if([[dicWebresponse objectForKey:@"status_message"] isEqualToString:@"success"])
      {
          NSData *data=[NSKeyedArchiver archivedDataWithRootObject:dicWebresponse];
          [SRUtility adddatatoplist:data key:@"SubCategories" plist:@"Data"];
      }
      
     }];
    
    
}
-(void)InitDataItems
{
    __block NSDictionary *dicWebresponse;
    HUD=[[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText=@"Please Wait Loading Master Data";
    [HUD showAnimated:YES whileExecutingBlock:^(void)
     {
         
         NSString *StrUrl=@"http://aceonetest.com/webservice/index.php?request=items";
         NSURL *TheUrl=[NSURL URLWithString:StrUrl];
         HUD.labelText=@"Please Wait Laoding Master data";
        
              dicWebresponse=[SRUtility makeWebServicecallForGetmethod:TheUrl];
         
         
         
         
     }
      completionBlock:^(void)
     { if ([[dicWebresponse objectForKey:@"status_message"] isEqualToString:@"success"])
       {
         NSData *data=[NSKeyedArchiver archivedDataWithRootObject:dicWebresponse];
         [SRUtility adddatatoplist:data key:@"Items" plist:@"Data"];
       }
     
     }];
    
}
-(void)InitDonorData
{
    __block NSDictionary *dicWebResponse;
    HUD=[[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText=@"Please Wait Loading Master data";
    [HUD showAnimated:YES whileExecutingBlock:^(void)
     {NSString *Strurl=@"http://aceonetest.com/webservice/index.php?request=donors";
         NSURL *TheUrl=[NSURL URLWithString:Strurl];
         dicWebResponse=[SRUtility makeWebServicecallForGetmethod:TheUrl];
         
     }
      completionBlock:^(void)
     {
         if ([[dicWebResponse objectForKey:@"status_message"] isEqualToString:@"success"])
         {
             NSData *dataDonors=[NSKeyedArchiver archivedDataWithRootObject:dicWebResponse];
             [SRUtility adddatatoplist:dataDonors key:@"Donors" plist:@"Data"];
             
         }
     
     }];
    
    
}


- (IBAction)BtnEnterClicked:(id)sender
{
    NSUserDefaults *Prefs=[NSUserDefaults standardUserDefaults];
    NSString *StrPasS=[Prefs objectForKey:@"PassCode"];
    if ([_TxtPassCode.text isEqualToString:StrPasS])
    {
        DashBoardViewController *ObjDash=[self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
        [self.navigationController pushViewController:ObjDash animated:YES];
       
    }
    else
    {
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"AREarlyLearning" message:@"The PassCode You Entered is Wrong" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [Alert show];
    }
}
@end
