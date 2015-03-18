//
//  DashBoardViewController.m
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 02/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import "DashBoardViewController.h"
#import "BFPaperButton.h"
#import "UIColor+BFPaperColors.h"
#import "SRTableViewCell.h"
#import "SRUtility.h"
#import "SRCollectionViewCell.h"
#import "AppDelegate.h"
#import "Product_Export_Establishment.h"
#import "SRDonorTableViewCell.h"
#import "EmailViewController.h"
#import "SignatureViewController.h"
#import "In_kind_volunteers.h"
#import "DonorDetailsViewController.h"
#import "NSString+Date.h"
@interface DashBoardViewController ()
@end
@implementation DashBoardViewController
@synthesize TblViewDonation,TblViewUserPopUp,ViewDetailedDescription;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self InitView];
    CollectionTag=100;
    ArrCollData=[[NSMutableArray alloc]init];
    [_btnback setHidden:YES];
    [self colleInData];
    NSData *data=[SRUtility getdatafromplist:@"ArrDonateData" plist:@"Data"];
    NSUInteger dataLength=[data length];
    if (dataLength==0)
       ArrTableData=[[NSMutableArray alloc]init];
     else
        ArrTableData=[NSKeyedUnarchiver unarchiveObjectWithData:data];

     UIImage *ImgProPic=[self loadImage];
     if (ImgProPic)
       [self InitProPic];
     else
       [_btnProPic setBackgroundImage:[UIImage imageNamed:@"anon_user.png"] forState:UIControlStateNormal];
     Valuesub=1;
     TblViewDonation .tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _searchBar.barTintColor=[UIColor whiteColor];
    _searchBar.backgroundColor=[UIColor clearColor];
    _searchBar.barStyle=UISearchBarStyleProminent;
    TblViewDonation.layer.borderColor=[UIColor grayColor].CGColor;
    TblViewDonation.layer.borderWidth=1.0;
    TblViewDonation.layer.cornerRadius=8.0;
    //Do any additional setup after loading the view.
}
-(void)colleInData
{
   
    
    NSData *dataCategory=[SRUtility getdatafromplist:@"Categories" plist:@"Data"];
    NSDictionary *DicTmp=[NSKeyedUnarchiver unarchiveObjectWithData:dataCategory];
    ArrCollData=[DicTmp objectForKey:@"data" ];
    
    collectionFlowTag=1001;
    
}

-(void)InitView
{   _btnCategory.layer.cornerRadius=16;
    _btnNotofication.layer.cornerRadius=16;
    _btnProPic.layer.cornerRadius=16;
    _btnDonate.layer.cornerRadius=16;
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setDefaultTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]}];
   _btnProPic.layer.cornerRadius=_btnProPic.frame.size.height/2;
    _btnProPic.clipsToBounds=YES;
    [_btnProPic setNeedsDisplay];
}
- (void)didReceiveMemoryWarning
{   [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)GrandTotal
{  float GrandTotal=0;
    float SubTotal = 0;
    for (NSDictionary *dictCurrent in ArrTableData)
    {
        NSString *StrTotal=[NSString stringWithFormat:@"%@",[dictCurrent objectForKey:@"dollTwo"]];
        SubTotal=[StrTotal floatValue];
        GrandTotal=GrandTotal+SubTotal;
    }
    NSString *StrTotal=[NSString stringWithFormat:@"%.2f",GrandTotal];
    [_LblGrandTotal setText:StrTotal];
}

-(void)BtnDonorClicked
{   UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"AREarlyLearning" message:@"Functionalities Yet To Be Implemented" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:Nil, nil];
    [alert show];
}
-(void)BtnDailyReportClicked
{   UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"AREarlyLearning" message:@"Functionalities Yet To Be Implemented" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:Nil, nil];
    [alert show];
}
-(void)InitProPic
{   [_btnProPic setBackgroundImage:[self loadImage] forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (UIImage*)loadImage
{   NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:@"ProfilPic.png"];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    return image;
}
- (IBAction)BtnUserNmeClicked:(id)sender
{   CGPoint Point=_btnUserNme.center;
    ArrPopData=[[NSArray alloc]initWithObjects:@"Change UserName",@"Change Password",@"Reset Profile",@"Help", nil];
    TblViewUserPopUp=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 250, 175)];
    TblViewUserPopUp.tag=2;
    TblViewUserPopUp.delegate=self;
    TblViewUserPopUp.dataSource = self;
    TblViewUserPopUp.scrollEnabled=YES;
    pv=[PopoverView showPopoverAtPoint:Point inView:self.view withContentView:TblViewUserPopUp delegate:self];
    pv.tag=500;
}
-(void)popoverView:(PopoverView *)popoverView didSelectItemAtIndex:(NSInteger)index
{   [popoverView performSelector:@selector(dismiss) withObject:nil afterDelay:0.3];
    if (pv.tag==500)
    {
    NSString *StrPop=[ArrPopData objectAtIndex:index];
    if ([StrPop isEqualToString:@"Change UserName"])
    {   UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"AREarlyLearning" message:@"Functionality yet to be implemented" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:Nil, nil];
        [alert show];
    }
    if ([StrPop isEqualToString:@"Change Password"])
    {   UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"AREarlyLearning" message:@"Functionality yet To Be Imnplemented" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:Nil, nil];
        [alert show];
    }
    if ([StrPop isEqualToString:@"Reset Profile"])
    {   UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"AREarlyLearning" message:@"Functionality Yet To Be Implemented" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:Nil, nil];
        [alert show];
    }
    if ([StrPop isEqualToString:@"Help"])
    {   UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"AREarlyLearning" message:@"Functionality Yet To Be Implemented" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:Nil, nil];
        [alert show];
    }
    }
    
    
}
- (IBAction)BtnProPicClicked:(id)sender
{   ChangeProfilePicViewController *ObjProPic=[self.storyboard instantiateViewControllerWithIdentifier:@"ChangeProfilePicViewController"];
    ObjProPic.ProPicChange=self;
    [self.parentViewController presentViewController:ObjProPic animated:YES completion:nil];
}
#pragma mark - UITableView Delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat SectionHeight=0;
    SectionHeight=35.0;
    return SectionHeight;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{   UIView *ViewTmp;
    if (tableView==TblViewUserPopUp)
    { ViewTmp=[[UIView alloc] initWithFrame:CGRectMake(-2, 0, tableView.frame.size.width+4, 35.0)];
        UILabel *LblTmp=[[UILabel alloc] initWithFrame:CGRectMake(10, 2, tableView.frame.size.width-10, 35.0)];
        NSString *StrProviderName=@"John Doe";
        [LblTmp setText:StrProviderName];
        [LblTmp setTextAlignment:NSTextAlignmentLeft];
        [ViewTmp addSubview:LblTmp];
    }
    if (tableView==TblViewDonation)
    {   ViewTmp=[[UIView alloc]initWithFrame:CGRectMake(-2, 0, tableView.frame.size.width+4, 40)];
        [ViewTmp setBackgroundColor:[UIColor whiteColor]];
        UILabel *LblName=[[UILabel alloc]initWithFrame:CGRectMake(15, 2, 70, 40)];
        [LblName setText:@"Name"];
        LblName.font=[UIFont fontWithName:@"Helvetica-Bold" size:18.0];
        [LblName setTextAlignment:NSTextAlignmentLeft];
        [ViewTmp addSubview:LblName];
        UILabel *LblQty=[[UILabel alloc]initWithFrame:CGRectMake(LblName.frame.origin.x+195, 2, 70, 40)];
        [LblQty setText:@"Qty"];
        LblQty.font=[UIFont fontWithName:@"Helvetica-Bold" size:18.0];
        [LblQty setTextAlignment:NSTextAlignmentLeft];
        [ViewTmp addSubview:LblQty];
        UILabel *lblEach=[[UILabel alloc]initWithFrame:CGRectMake(LblQty.frame.origin.x+100, 2, 70, 40)];
        [lblEach setText:@"Each"];
        lblEach.font=[UIFont fontWithName:@"Helvetica-Bold" size:18.0];
        [lblEach setTextAlignment:NSTextAlignmentLeft];
        [ViewTmp addSubview:lblEach];
        UILabel *LblTotal=[[UILabel alloc]initWithFrame:CGRectMake(lblEach.frame.origin.x+80, 2, 70, 40)];
        [LblTotal setText:@"Total"];
        LblTotal.font=[UIFont fontWithName:@"Helvetica-Bold" size:18.0];
        [LblTotal setTextAlignment:NSTextAlignmentLeft];
        [ViewTmp addSubview:LblTotal];
    }
    return ViewTmp;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{  NSString *StrTitle;
    if(tableView==TblViewUserPopUp)
        StrTitle=[NSString stringWithFormat:@"%@",[ArrPopData objectAtIndex:0]];
    return StrTitle;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{  NSInteger RowCount;
    switch (tableView.tag)
    {     case 1:
            RowCount=[ArrTableData count];
           break;
          case 2:
            RowCount=[ArrPopData count];
            break;
        default:
            break;
    }
    return RowCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat RowHeight;
    switch (tableView.tag)
    {
        case 1:
            RowHeight=45.0;
            break;
        case 2:
           RowHeight=35.0;
           break;
        default:
            break;
    }
    return RowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   SRTableViewCell *cell=(SRTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"myidentifier"];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SRTableViewCell" owner:self options:nil];
    cell = [nib objectAtIndex:0];
    if(tableView==TblViewUserPopUp)
   {   cell.LblValue.hidden=YES;
       cell.LblDollOne.hidden=YES;
       cell.LblDollTwo.hidden=YES;
       cell.btnAdd.hidden=YES;
       cell.btnMinus.hidden=YES;
       cell.LblTblDetails.textColor=[UIColor darkGrayColor];
       cell.LblTblDetails.font = [UIFont boldSystemFontOfSize:14.0];
       cell.LblTblDetails.text=[ArrPopData objectAtIndex:indexPath.row];
       [cell.LblTblDetails setLineBreakMode:UILineBreakModeWordWrap];
       [cell.LblTblDetails setAdjustsFontSizeToFitWidth:NO];
       [cell.LblTblDetails setNumberOfLines:0];
       cell.backgroundColor=[UIColor whiteColor];
       [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
   }
    if (tableView==TblViewDonation)
   {    cell.btnAdd.tag=indexPath.row;
        cell.btnMinus.tag=indexPath.row;
        cell.LblTblDetails.text=[[ArrTableData objectAtIndex:indexPath.row] objectForKey:@"TblMaincontent"];
        cell.LblValue.text=[[ArrTableData objectAtIndex:indexPath.row] objectForKey:@"value"];
        cell.LblDollOne.text=[[ArrTableData objectAtIndex:indexPath.row]objectForKey:@"dollOne"];
        cell.LblDollTwo.text=[[ArrTableData objectAtIndex:indexPath.row] objectForKey:@"dollTwo"];
        [self GrandTotal];
        [cell.btnAdd addTarget:self action:@selector(ValueAdded:) forControlEvents:UIControlEventTouchUpInside];
        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        [cell.btnMinus addTarget:self action:@selector(ValueMinus:) forControlEvents:UIControlEventTouchUpInside];
    }
   return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [ArrTableData removeObjectAtIndex:indexPath.row];
        [TblViewDonation reloadData];
        
    }
}
#pragma mark
#pragma mark PopoverDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self popoverView:pv didSelectItemAtIndex:indexPath.row];
    NSDictionary *dictCurrent=[ArrTableData objectAtIndex:indexPath.row];
    [ObjDonDetailedView removeFromSuperview];
    
    ObjDonDetailedView=[[[NSBundle mainBundle]loadNibNamed:@"DonationDetailedView" owner:self options:nil ] objectAtIndex:0];
    ObjDonDetailedView.layer.cornerRadius=8.0;
    [ObjDonDetailedView.ImgDonate setImage:[UIImage imageNamed:[dictCurrent objectForKey:@"CategoryImage"]]];
    [ObjDonDetailedView.LblDonateDetails setText:[dictCurrent objectForKey:@"TblMaincontent"]];
    //[ObjDonDetailedView.LblQty setText:[dictCurrent objectForKey:@"value"]];
    ObjDonDetailedView.btnAdd.tag=indexPath.row;
    ObjDonDetailedView.btnMinus.tag=indexPath.row;
    [ObjDonDetailedView.LblValue setText:[dictCurrent objectForKey:@"value"]];
    [ObjDonDetailedView.btnAdd addTarget:self action:@selector(ValueAdded:) forControlEvents:UIControlEventTouchUpInside];
    [ObjDonDetailedView.btnMinus addTarget:self action:@selector(ValueMinus:) forControlEvents:UIControlEventTouchUpInside];
   [self.ViewDonateDetails addSubview:ObjDonDetailedView];
    ViewCreated=YES;
    
}
- (IBAction)BtnCategoryClicked:(id)sender
{
  
  [ObjDonDetailedView removeFromSuperview];
    
}

- (IBAction)BtnNotificationClicked:(id)sender
{
    
}

#pragma mark
#pragma mark valuechanged
-(IBAction)ValueAdded:(id)sender
{
    int tag=[sender tag];
    NSString *StrCurrValue=[[ArrTableData objectAtIndex:tag] objectForKey:@"value"];
    NSString *StrDollEach=[[ArrTableData objectAtIndex:tag]objectForKey:@"dollOne"];
    float DollEach=[StrDollEach floatValue];
    Valuesub=[StrCurrValue intValue];
    Valuesub++;
    if (Valuesub==0)
        Valuesub=1;
    float DollEachTotal=DollEach*Valuesub;
    NSString *StrDollTotal=[NSString stringWithFormat:@"%.2f",DollEachTotal];
    NSString *StrValue=[NSString stringWithFormat:@"%d",Valuesub];
    [ArrTableData removeObject:[[ArrTableData objectAtIndex: tag] objectForKey:@"value"]];
    [[ArrTableData objectAtIndex:tag] setObject:StrValue forKey:@"value"];
    if (ViewCreated==YES)
      [ObjDonDetailedView.LblValue setText:StrValue];
    
    //[[ArrTableData objectAtIndex:tag] setObject:StrDollTotal forKey:@"dollOne"];
    [[ArrTableData objectAtIndex:tag]setObject:StrDollTotal forKey:@"dollTwo"];
    [TblViewDonation reloadData];
    ViewCreated=NO;
    
}
-(IBAction)ValueMinus:(id)sender
{   NSString *StrCurrValue=[[ArrTableData objectAtIndex:[sender tag]]objectForKey:@"value"];
    Valuesub=[StrCurrValue intValue];
    NSString *StrDollEach=[[ArrTableData objectAtIndex:[sender tag]]objectForKey:@"dollOne"];
    float DollEach=[StrDollEach floatValue];
    Valuesub=[StrCurrValue floatValue];
    Valuesub--;
    if (Valuesub==0)
        Valuesub=1;
    float DollEachTotal=DollEach*Valuesub;
    NSString *StrDollTotal=[NSString stringWithFormat:@"%.2f",DollEachTotal];
    NSString *Strvalue=[NSString stringWithFormat:@"%d",Valuesub];
    [ArrTableData removeObject:[[ArrTableData objectAtIndex:[sender tag]] objectForKey:@"value"]];
    [[ArrTableData objectAtIndex:[sender tag]] setObject:Strvalue forKey:@"value"];
    //[[ArrTableData objectAtIndex:[sender tag]] setObject:StrDollTotal forKey:@"dollOne"];
    [[ArrTableData objectAtIndex:[sender tag]]setObject:StrDollTotal forKey:@"dollTwo"];
    [TblViewDonation reloadData];
}
-(void)ReloadTablFromOtherView:(NSDictionary *)dictCategory
{
    
    [ArrTableData addObject:dictCategory];
     [TblViewDonation reloadData];
}
- (IBAction)BtnDonateClicked:(id)sender
{   NSData *data=[NSKeyedArchiver archivedDataWithRootObject:ArrTableData];
    [SRUtility adddatatoplist:data key:@"ArrDonateData" plist:@"Data"];
    
    if (_donorDetails)
    {
    SignatureViewController *ObjSignature=[self.storyboard instantiateViewControllerWithIdentifier:@"SignatureViewController"];
    ObjSignature.ArrData=ArrTableData;
    ObjSignature.dicDonor=_donorDetails;
    [self.parentViewController presentViewController: ObjSignature animated:YES completion:Nil];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"AREarlyLearning" message:@"Please Select A Donor" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
}
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [ArrCollData count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{ SRCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"SRCollectionViewCell" forIndexPath:indexPath];
  [cell.LblCategory setText:[[ArrCollData objectAtIndex:indexPath.row] objectForKey:@"category_name"]];
  [cell.ImgCategory setImage:[UIImage imageNamed:[[ArrCollData objectAtIndex:indexPath.row] objectForKey:@"category_image"]]];
    NSInteger StrLength= [cell.LblCategory.text length];
    
    
  return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSDictionary *dictCurrent=[ArrCollData objectAtIndex:indexPath.row];
    NSMutableArray *arrTmp=[[NSMutableArray alloc]init];
    if (collectionFlowTag==1001)
    {
        [_btnback setHidden:NO];
    
   
        [ArrCollData removeAllObjects];
        NSPredicate *ThePredciate=[NSPredicate predicateWithFormat:@"SELF.category_id=%@",[dictCurrent objectForKey:@"category_id"]];
        
        NSData *dataSubCategory=[SRUtility getdatafromplist:@"SubCategories"plist:@"Data"];
        NSDictionary *dicTmp= [NSKeyedUnarchiver unarchiveObjectWithData:dataSubCategory];
        NSArray *ArrFltrd=[[dicTmp objectForKey:@"data"] filteredArrayUsingPredicate:ThePredciate];
        
        for ( NSMutableDictionary *dictCrrnt in ArrFltrd)
        {
            [dictCrrnt setObject:[dictCrrnt objectForKey:@"sub_category_name"] forKey:@"category_name"];
            [dictCrrnt setObject:[dictCrrnt objectForKey:@"sub_category_image"] forKey:@"category_image"];
            [ArrCollData addObject:dictCrrnt];
            
        }
        
        
        
      [_ClctnCategory reloadData];
    
        collectionFlowTag=2001;
    }
    else if (collectionFlowTag==2001)
    {
        [_btnback setHidden:NO];
        [ArrCollData removeAllObjects];
       
        
        NSPredicate *ThePreciate=[NSPredicate predicateWithFormat:@"SELF.sub_category_id=%@",[dictCurrent objectForKey:@"sub_category_id"]];
        
         NSData *dataItems=[SRUtility getdatafromplist:@"Items"plist:@"Data"];
        
        NSDictionary *dicTmp= [NSKeyedUnarchiver unarchiveObjectWithData:dataItems];
        NSArray *ArrFltrd=[[dicTmp objectForKey:@"data"] filteredArrayUsingPredicate:ThePreciate];
        for (NSMutableDictionary *dictCurrent in ArrFltrd )
        {
            [dictCurrent setObject:[dictCurrent objectForKey:@"item_name"] forKey:@"category_name"];
            [dictCurrent setObject:[dictCurrent objectForKey:@"item_image"] forKey:@"category_image"];
            [ArrCollData addObject:dictCurrent];
            
        }
        [_ClctnCategory reloadData];
        
        
        collectionFlowTag=5001;
    }
    else if (collectionFlowTag==5001)
    {
        [_btnback setHidden:NO];
        if ([[dictCurrent objectForKey:@"unit_price"] isEqualToString:@"0.00"])
        {    NSDictionary *dictToCurrentTbl=[ArrCollData objectAtIndex:indexPath.row];
            FormSheetViewController *objFormSheet=[self.storyboard instantiateViewControllerWithIdentifier:@"FormSheetViewController"];
            objFormSheet.strProDescp=[dictToCurrentTbl objectForKey:@"item_description"];
            objFormSheet.dicItem=dictToCurrentTbl;
            objFormSheet.categoryChange=self;
            [self.parentViewController presentViewController:objFormSheet animated:YES completion:Nil];
        }
        else
        {
            NSDictionary *dictToCurrentTbl=[ArrCollData objectAtIndex:indexPath.row];
            NSMutableDictionary *dicTabledata=[[NSMutableDictionary alloc]init];
            [dicTabledata setObject:[dictToCurrentTbl objectForKey:@"item_description"] forKey:@"TblMaincontent"];
            [dicTabledata setObject:@"1" forKey:@"value"];
            [dicTabledata setObject:[dictToCurrentTbl objectForKey:@"unit_price"] forKey:@"dollOne"];
            [dicTabledata setObject:[dictToCurrentTbl objectForKey:@"unit_price"] forKey:@"dollTwo"];
            [dicTabledata setObject:[dictToCurrentTbl objectForKey:@"item_id"] forKey:@"item_id"];
            [ArrTableData addObject:dicTabledata];
            
            [TblViewDonation reloadData];
        }
        
        collectionFlowTag=1001;
        
    }
}
- (IBAction)BtnDailyReportClicked:(id)sender
{
    UIButton *btnSetAppoint=sender;
    CGPoint insertPoint=btnSetAppoint.center;
    insertPoint.x-=self.view.frame.origin.x;
    insertPoint.y+=btnSetAppoint.frame.size.height/2.0;
    
    calVC = [[OCCalendarViewController alloc] initAtPoint:insertPoint inView:self.view arrowPosition:OCArrowPositionLeft selectionMode:OCSelectionSingleDate];
    calVC.delegate = self;
    [self.view addSubview:calVC.view];
    [calVC becomeFirstResponder];

    
}
#pragma mark OCCalendarDelegate Methods
-(void)DateSelectedOCCalendar
{
    [calVC removeCalView];
}

- (void)completedWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateStyle:NSDateFormatterShortStyle];
    NSString *StrTmpDate=@"";
    StrTmpDate=[StrTmpDate StringFrom_cDate:startDate];
    [calVC.view removeFromSuperview];
    calVC.delegate = nil;
    calVC = nil;
}

-(void) completedWithNoSelection{
    [calVC.view removeFromSuperview];
    calVC.delegate = nil;
    calVC = nil;
}
- (IBAction)BtnDonorClicked:(id)sender
{
    DonorDetailsViewController *ObjDonors=[self.storyboard instantiateViewControllerWithIdentifier:@"DonorDetailsViewController"];
    ObjDonors.DonorChange=self;
    [self.parentViewController presentViewController:ObjDonors animated:YES completion:Nil];
    
    
}
-(void)presentEmailView
{
    EmailViewController *ObjEmail=[self.storyboard instantiateViewControllerWithIdentifier:@"EmailViewController"];
    [self.parentViewController presentViewController:ObjEmail animated:YES completion:nil];
}
-(void)presentSignatureView
{
    SignatureViewController *ObjSign=[self.storyboard instantiateViewControllerWithIdentifier:@"SignatureViewController"];
    [self.parentViewController presentViewController:ObjSign animated:YES completion:nil];
}
- (IBAction)BackBtnClicked:(id)sender
{
    
    NSDictionary *dictTmp=[ArrCollData objectAtIndex:0];
    if([dictTmp objectForKey:@"item_id"])
    {
        NSPredicate *ThePredicate=[NSPredicate predicateWithFormat:@"SELF.sub_category_id=%@",[dictTmp objectForKey:@"sub_category_id"]];
        NSData *SubCatData=[SRUtility getdatafromplist:@"SubCategories" plist:@"Data"];
        NSDictionary *dicTmp=[NSKeyedUnarchiver unarchiveObjectWithData:SubCatData];
        NSArray *ArrFltrd=[[dicTmp objectForKey:@"data"] filteredArrayUsingPredicate:ThePredicate];
        [ArrCollData removeAllObjects];
        for (NSMutableDictionary *dictCurrent in ArrFltrd )
        {
            [dictCurrent setObject:[dictCurrent objectForKey:@"sub_category_name"] forKey:@"category_name"];
            [dictCurrent setObject:[dictCurrent objectForKey:@"sub_category_image"] forKey:@"category_image"];
            [ArrCollData addObject:dictCurrent];
            
        }
        [_ClctnCategory reloadData];
        collectionFlowTag=2001;
    }
    else
    {
        NSPredicate *ThePredicate=[NSPredicate predicateWithFormat:@"SELF.category_id=%@",[dictTmp objectForKey:@"category_id"]];
        NSData *CatData=[SRUtility getdatafromplist:@"Categories" plist:@"Data"];
        NSDictionary *dicTmp=[NSKeyedUnarchiver unarchiveObjectWithData:CatData];
        NSArray *ArrFltrd=[[dicTmp objectForKey:@"data"] filteredArrayUsingPredicate:ThePredicate];
        [ArrCollData removeAllObjects];
        for (NSMutableDictionary *dictCurrent in [dicTmp objectForKey:@"data"])
        {
            [ArrCollData addObject:dictCurrent];
            
        }
        [_ClctnCategory reloadData];
        [_btnback setHidden:YES];
        collectionFlowTag=1001;
    }
    
    //NSPredicate *ThePredicate=[NSPredicate predicateWithFormat:@"SELF."];
    
}
-(void)recieveDonorDetails:(NSDictionary *)dictDonor
{
    _donorDetails=dictDonor;
  
}

@end
