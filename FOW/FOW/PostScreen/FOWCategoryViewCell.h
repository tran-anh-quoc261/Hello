//
//  FOWCategoryViewCell.h
//  FOW
//
//  Created by Anh Quoc on 11/5/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWViewCell.h"

@interface FOWCategoryViewCell : FOWViewCell

@property (weak, nonatomic) IBOutlet UISegmentedControl *sgmCategory;
@property (weak, nonatomic) IBOutlet UIButton *btnCategory;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@end
