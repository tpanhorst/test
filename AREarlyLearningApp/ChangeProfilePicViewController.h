//
//  ChangeProfilePicViewController.h
//  AREarlyLearningApp
//
//  Created by Sreejith Rajan on 02/03/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
@protocol ProfPicDelegate
@optional
-(void)InitProPic;
@end
@interface ChangeProfilePicViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ImgProPic;
@property(nonatomic,retain) id<ProfPicDelegate>ProPicChange;
@end
