//
//  FOWMainViewCell.h
//  FOW
//
//  Created by Anh Quoc on 11/4/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWViewCell.h"
#import "FOWCustomTextView.h"

@interface FOWMainViewCell : FOWViewCell

@property (weak, nonatomic) IBOutlet FOWCustomTextView *txtDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnAddPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *imgEdit1;
@property (weak, nonatomic) IBOutlet UIImageView *imgEdit2;
@property (weak, nonatomic) IBOutlet UIImageView *imgEdit3;
@property (weak, nonatomic) IBOutlet UIImageView *imgEdit4;
@property (weak, nonatomic) IBOutlet UIImageView *imgEdit5;

@end
