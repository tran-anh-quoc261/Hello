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

@end
