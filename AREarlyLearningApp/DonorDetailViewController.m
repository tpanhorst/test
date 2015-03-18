//
//  DonorDetailViewController.m
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 07/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import "DonorDetailViewController.h"
#import "EmailViewController.h"
#import "SignatureViewController.h"
@interface DonorDetailViewController ()

@end

@implementation DonorDetailViewController
@synthesize delegateDonate;
- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)BtnEmailClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.delegateDonate)
        [delegateDonate presentEmailView];
    
    
}
- (IBAction)BtnSignatureClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.delegateDonate)
        [delegateDonate presentSignatureView];
        
    
    
}
@end
