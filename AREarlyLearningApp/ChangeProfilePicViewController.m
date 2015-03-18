//
//  ChangeProfilePicViewController.m
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 02/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import "ChangeProfilePicViewController.h"
#import "BFPaperButton.h"
#import "UIColor+BFPaperColors.h"
#import "SRImagePicker.h"
@interface ChangeProfilePicViewController ()

@end

@implementation ChangeProfilePicViewController
@synthesize ProPicChange;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view.
}
-(void)initView
{
    BFPaperButton *BtnTakePhoto = [[BFPaperButton alloc] initWithFrame:CGRectMake(37,20, 90,43) raised:NO];
    [BtnTakePhoto setTitle:@"Take Photo" forState:UIControlStateNormal];
    [BtnTakePhoto setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    BtnTakePhoto.backgroundColor = [UIColor paperColorBlue100 ];
    [BtnTakePhoto setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [BtnTakePhoto setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [BtnTakePhoto addTarget:self action:@selector(TakePhoto) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:BtnTakePhoto];
    
    BFPaperButton *BtnChangePhoto = [[BFPaperButton alloc] initWithFrame:CGRectMake(135,20, 105, 43) raised:NO];
    [BtnChangePhoto setTitle:@"Change Photo" forState:UIControlStateNormal];
    [BtnChangePhoto setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    BtnChangePhoto.backgroundColor = [UIColor paperColorBlue100 ];
    [BtnChangePhoto setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [BtnChangePhoto setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [BtnChangePhoto addTarget:self action:@selector(ChangePhoto) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:BtnChangePhoto];
    
    BFPaperButton *BtnSave = [[BFPaperButton alloc] initWithFrame:CGRectMake(247,20, 90,43) raised:NO];
    [BtnSave setTitle:@"Save" forState:UIControlStateNormal];
    [BtnSave setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    BtnSave.backgroundColor = [UIColor paperColorBlue100 ];
    [BtnSave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [BtnSave setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [BtnSave addTarget:self action:@selector(SavePhoto) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:BtnSave];
    
    BFPaperButton *BtnClose = [[BFPaperButton alloc] initWithFrame:CGRectMake(371,20, 90,43) raised:NO];
    [BtnClose setTitle:@"Close" forState:UIControlStateNormal];
    [BtnClose setTitleFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];
    BtnClose.backgroundColor = [UIColor redColor];
    [BtnClose setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [BtnClose setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [BtnClose addTarget:self action:@selector(CloseView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:BtnClose];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)TakePhoto
{
    if ([SRImagePicker isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {   SRImagePicker *imagePicker =
        [[SRImagePicker alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker animated:YES completion:Nil];
    }
    else
    {   UIAlertView *Alert=[[UIAlertView alloc] initWithTitle:@"Sorry" message:@"Camera not avaliable for the device" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [Alert show];
    }
}
-(void)ChangePhoto
{
    
    SRImagePicker *imagePicker =
    [[SRImagePicker alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType =
    UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
    imagePicker.allowsEditing = YES;
    [self presentViewController:imagePicker animated:YES completion:Nil];

}
-(void)SavePhoto
{
    if (_ImgProPic !=nil)
    {
      
        [self saveImage:_ImgProPic.image];
        if (self.ProPicChange)
           [ProPicChange InitProPic];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"AREarlyLearning" message:@"No Photo Selected" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}
-(void)CloseView
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
- (void)saveImage: (UIImage*)image
{
    if (image != nil)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString* path = [documentsDirectory stringByAppendingPathComponent:
                          @"ProfilPic.png" ];
        NSData* data = UIImagePNGRepresentation(image);
        [data writeToFile:path atomically:YES];
    }
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
    {   UIImage *image = info[UIImagePickerControllerEditedImage];
        CGSize sacleSize = _ImgProPic.frame.size;
        UIGraphicsBeginImageContextWithOptions(sacleSize, NO, 0.0);
        [image drawInRect:CGRectMake(0, 0, sacleSize.width, sacleSize.height)];
        UIImage * resizedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [_ImgProPic setImage:resizedImage];
    }
    [picker dismissViewControllerAnimated:YES completion:Nil];
}

@end
