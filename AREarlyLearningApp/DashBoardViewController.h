//
//  DashBoardViewController.h
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 02/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeProfilePicViewController.h"
#import "PopoverView.h"
#import "FormSheetViewController.h"
#import "DonationDetailedView.h"
#import "DonorDetailViewController.h"
#import "DonorDetailsViewController.h"
#import "OCCalendarViewController.h"
@interface DashBoardViewController : UIViewController<ProfPicDelegate,PopoverViewDelegate,UITableViewDataSource,UITableViewDelegate,CategoryDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UISearchBarDelegate,DonateDataDelegate,OCCalendarDelegate,donorDelegate>
{  OCCalendarViewController *calVC;
    NSArray *ArrPopData;
    PopoverView *pv;
    int TblCellClickedValue;
    NSMutableArray *ArrTableData;
    int Valuesub;
    NSMutableArray *ArrCollData;
    int CollectionTag;
    DonationDetailedView *ObjDonDetailedView;
    BOOL ViewCreated;
    int collectionFlowTag;
    NSMutableArray *ArrDonorData;
    
}
@property(strong,nonatomic) NSDictionary*donorDetails;
@property (weak, nonatomic) IBOutlet UIButton *btnUserNme;
- (IBAction)BtnUserNmeClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnProPic;
- (IBAction)BtnProPicClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *btnCategory;
- (IBAction)BtnCategoryClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnNotofication;
- (IBAction)BtnNotificationClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *TblViewDonation;
@property(strong,nonatomic) UITableView *TblViewUserPopUp;
@property (weak, nonatomic) IBOutlet UILabel *LblGrandTotal;
@property (weak, nonatomic) IBOutlet UIButton *btnDonate;
- (IBAction)BtnDonateClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UICollectionView *ClctnCategory;
@property (weak, nonatomic) IBOutlet UIView *ViewDonateDetails;
@property (weak, nonatomic) IBOutlet UIView *ViewDetailedDescription;
@property (strong, nonatomic) IBOutlet UIView *viewDonor;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBarDonor;
@property (weak, nonatomic) IBOutlet UITableView *tblDonor;
@property (weak, nonatomic) IBOutlet UIButton *btnDailyRprs;
- (IBAction)BtnDailyReportClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnDonor;
- (IBAction)BtnDonorClicked:(id)sender;
@property(strong,nonatomic) UITableView *TableDonorDetails;
@property (weak, nonatomic) IBOutlet UIButton *btnback;
- (IBAction)BackBtnClicked:(id)sender;


@end
