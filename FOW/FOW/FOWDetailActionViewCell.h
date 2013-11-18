//
//  FOWDetailActionViewCell.h
//  FOW
//
//  Created by Anh Quoc on 11/14/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWViewCell.h"

@protocol FOWDetailActionViewCellDelegate;

@interface FOWDetailActionViewCell : FOWViewCell {
    
}

@property (assign, nonatomic) id <FOWDetailActionViewCellDelegate> delegate;

@end

@protocol FOWDetailActionViewCellDelegate <NSObject>


@end
