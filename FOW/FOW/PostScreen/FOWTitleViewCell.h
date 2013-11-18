//
//  FOWTitleViewCell.h
//  FOW
//
//  Created by Anh Quoc on 11/4/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWViewCell.h"

@interface FOWTitleViewCell : FOWViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblCountCharactor;
@property (assign, nonatomic) BOOL flagTextViewError;

- (IBAction)txtChangeValue:(id)sender;
@end
