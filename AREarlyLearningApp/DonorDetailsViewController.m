//
//  DonorDetailsViewController.m
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 09/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import "DonorDetailsViewController.h"
#import "SRUtility.h"
#import "In_kind_volunteers.h"
@interface DonorDetailsViewController ()

@end

@implementation DonorDetailsViewController
@synthesize TblDonorDetails,searchBar,DonorChange;
- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    ArrData=[appDelegate getDonors];
    NSData *DataDonors=[SRUtility getdatafromplist:@"Donors" plist:@"Data"];
    NSDictionary *DicTmp=[NSKeyedUnarchiver unarchiveObjectWithData:DataDonors];
    ArrTableData=[DicTmp objectForKey:@"data"];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ArrData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SRDonorCell"];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SRDonorCell"];
    }
   // In_kind_volunteers *check=[ArrData objectAtIndex:indexPath.row];
   // NSString *StrFname=[NSString stringWithFormat:@"%@ ",check.fname];
   // NSString *StrFullName=[StrFname stringByAppendingString:check.lname];
    cell.textLabel.text=[[ArrTableData objectAtIndex:indexPath.row] objectForKey:@"donor_name"];
    
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    In_kind_volunteers *check=[ArrData objectAtIndex:indexPath.row];
     dictCurrent =[ArrTableData objectAtIndex:indexPath.row];
    
    
    ObjDonorDetail=[[[NSBundle mainBundle]loadNibNamed:@"DonorInformationView" owner:self options:Nil] objectAtIndex:0];
    NSString *StrFname=[NSString stringWithFormat:@"%@ ",check.fname];
    NSString *StrFullName=[StrFname stringByAppendingString:check.lname];
    ObjDonorDetail.LblName.text=[dictCurrent objectForKey:@"donor_name"];
    ObjDonorDetail.LblCellNum.text=[dictCurrent objectForKey:@"phone1"];
    ObjDonorDetail.LblPin.text=[dictCurrent objectForKey:@"zip"];
    ObjDonorDetail.LblStreet.text=[dictCurrent objectForKey:@"address"];
    ObjDonorDetail.LblState.text=[dictCurrent objectForKey:@"state"];
    ObjDonorDetail.LblCntry.text=check.cntry;
    ObjDonorDetail.LblDonatedDate.text=check.date;
    [ObjDonorDetail.btnBack addTarget:self action:@selector(BackBtnCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [ObjDonorDetail.btnDonorSelect addTarget:self action:@selector(BtnSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ObjDonorDetail];
    
}
-(IBAction)BtnSelect:(id)sender
{  if (self.DonorChange)
    [DonorChange recieveDonorDetails:dictCurrent];


}
-(IBAction)BackBtnCLicked:(id)sender
{
       [ObjDonorDetail removeFromSuperview];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)BtnCancelCliked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
/*#pragma mark
#pragma mark Search Functionality
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    [searchResults removeAllObjects];
    
    if (!searchText.length)
    {
      
        
        //[_TblSettings reloadData];
    }
    else
    {
        // Filter the array using NSPredicate
      
        for (In_kind_volunteers *check in ArrData )
        {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",searchText];
            //searchResults=[check.];
        }
        
       
        
        searchResults = [NSMutableArray arrayWithArray:[ArrTblContnts filteredArrayUsingPredicate:predicate]];
        ArrTblContnts=[searchResults mutableCopy];
    }
    [_TblSettings reloadData];
}
#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    //[self positionForBar:0];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{   appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    ArrData=[appDelegate getDonors];
    [TblDonorDetails reloadData];
    // [_TblSettings scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}
*/
@end
