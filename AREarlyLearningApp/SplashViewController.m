//
//  SplashViewController.m
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 02/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import "SplashViewController.h"
#import "BFPaperButton.h"
#import "UIColor+BFPaperColors.h"
#import "PassWordViewController.h"
#import "DashBoardViewController.h"
@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BFPaperButton *bfFlatSmart = [[BFPaperButton alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height) raised:NO];
   [bfFlatSmart setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    bfFlatSmart.backgroundColor = [UIColor clearColor ];
    [bfFlatSmart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bfFlatSmart setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [bfFlatSmart addTarget:self action:@selector(NetView) forControlEvents:UIControlEventTouchUpInside];
    bfFlatSmart.rippleFromTapLocation = YES;
    bfFlatSmart.rippleBeyondBounds = YES;
    bfFlatSmart.tapCircleDiameter = MAX(bfFlatSmart.frame.size.width, bfFlatSmart.frame.size.height) * 1.3;
    [self.view addSubview:bfFlatSmart];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)NetView
{
    
    PassWordViewController *ObjPass=[self.storyboard instantiateViewControllerWithIdentifier:@"PassWordViewController"];
    [self.navigationController pushViewController:ObjPass animated:YES];
}
@end
