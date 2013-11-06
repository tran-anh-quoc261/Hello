//
//  FOWPostPhotoViewController.h
//  FOW
//
//  Created by Anh Quoc on 10/31/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWTableViewController.h"

@interface FOWPostPhotoViewController : FOWTableViewController <UITextViewDelegate, UITextFieldDelegate, UIAlertViewDelegate, UIActionSheetDelegate> {
    NSMutableArray              *dataSource;
    UITapGestureRecognizer      *gesture;
    
}

@end
