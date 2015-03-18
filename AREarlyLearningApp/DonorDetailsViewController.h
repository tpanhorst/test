//
//  DonorDetailsViewController.h
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 09/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DonorInformationView.h"
#import "AppDelegate.h"
@protocol donorDelegate
@optional
-(void)recieveDonorDetails:(NSDictionary *)dictDonor;
@end
@interface DonorDetailsViewController : UIViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>
{   NSDictionary *dictCurrent;
    NSArray *ArrData;
    DonorInformationView *ObjDonorDetail;
    NSMutableArray *searchResults;
    AppDelegate *appDelegate;
    NSMutableArray *ArrTableData;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *TblDonorDetails;
@property (weak, nonatomic) IBOutlet UIButton *BtnCancelClicked;
- (IBAction)BtnCancelCliked:(id)sender;
@property(nonatomic,retain) id<donorDelegate>DonorChange;
@end
