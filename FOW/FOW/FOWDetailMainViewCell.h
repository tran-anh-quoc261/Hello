//
//  FOWDetailViewCell.h
//  FOW
//
//  Created by Anh Quoc on 11/14/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWViewCell.h"

@protocol FOWDetailMainViewCellDelegate;

@interface FOWDetailMainViewCell : FOWViewCell {
    
}

@property (weak, nonatomic) IBOutlet UIImageView *imgReview;
@property (assign, nonatomic) id <FOWDetailMainViewCellDelegate> delegate;

- (void)configView;

@end

@protocol FOWDetailMainViewCellDelegate <NSObject>



@end
