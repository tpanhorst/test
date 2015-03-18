//
//  SRCollectionViewCell.h
//  AREarlyLearningApp
//
//  Created by HIWORTH2 on 3/5/15.
//  Copyright (c) 2015 Sreejith Rajan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ImgCategory;
@property (weak, nonatomic) IBOutlet UIView *ViewCategory;
@property (weak, nonatomic) IBOutlet UILabel *LblCategory;
@end
