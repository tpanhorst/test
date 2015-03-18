//
//  SignatureViewController.m
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 08/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import "SignatureViewController.h"
#import "SRUtility.h"
@interface SignatureViewController ()

@end

@implementation SignatureViewController
@synthesize ArrData;
- (void)viewDidLoad {
    [super viewDidLoad];
    signatureView= [[PJRSignatureView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.width)];
    
    
    [self.view addSubview:signatureView];
    [self.view sendSubviewToBack:signatureView];
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

- (IBAction)BtnClearClicked:(id)sender
{
     [signatureView clearSignature];
}
- (IBAction)BtnSaveClicked:(id)sender
{
    UIImage *SigImage=[signatureView getSignatureImage];
    NSArray *ArrTmp=[ArrData mutableCopy];
    dictToSend=[[NSMutableDictionary alloc]init];
    NSDictionary *donorDetails=[_dicDonor mutableCopy];
    NSMutableArray *ArrDonations=[[NSMutableArray alloc]init];
    for (NSDictionary *dictCurrent in ArrTmp )
    {   NSMutableDictionary *dicDonations=[[NSMutableDictionary alloc]init];
        [dicDonations setObject:[dictCurrent objectForKey:@"dollTwo"] forKey:@"unit_price"];
        [dicDonations setObject:[dictCurrent objectForKey:@"item_id"] forKey:@"item_id"];
        [dicDonations setObject:[dictCurrent objectForKey:@"value"] forKey:@"qty"];
        [dicDonations setObject:[donorDetails objectForKey:@"donor_id"] forKey:@"donor_id"];
        [dicDonations setObject:[NSString stringWithFormat:@"data:image/png;base64,%@",[self imageToNSString:SigImage]] forKey:@"signature"];
        [dicDonations setObject:_LblEmail.text forKey:@"EmailId"];
        [ArrDonations addObject:dicDonations];
    }
    [dictToSend setObject:ArrDonations forKey:@"donations"];

    NSString *StrUrl=[NSString stringWithFormat:@"http://aceonetest.com/webservice/transaction.php"];
    NSURL *TheU=[NSURL URLWithString:StrUrl];
    NSDictionary *dicWebResponse=[SRUtility makeWebServiceCallForPOSTMethod:TheU withAppendData:dictToSend withRequestHeaderOne:@"User-Agent" withRequestHeaderTwo:@"Content-Type" withHeaderValueOne:@"ASIHTTPRequest" withHeaderValueTwo:@"application/json"];
    
    
    
}
- (IBAction)BtnCancelClicked:(id)sender
{
    
}
-(NSString *)imageToNSString:(UIImage *)image
{
    NSData *imageData = UIImagePNGRepresentation(image);
    return [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

@end
