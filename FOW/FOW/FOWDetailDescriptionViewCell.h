//
//  FOWDetailDescriptionViewCell.h
//  FOW
//
//  Created by Anh Quoc on 11/14/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWViewCell.h"

@protocol FOWDetailDescriptionViewCellDelegate;

@interface FOWDetailDescriptionViewCell : FOWViewCell {
    
}

@property (assign, nonatomic) id <FOWDetailDescriptionViewCellDelegate> delegate;

@end

@protocol FOWDetailDescriptionViewCellDelegate <NSObject>


@end
