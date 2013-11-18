//
//  FOWDetailPostViewController.h
//  FOW
//
//  Created by Anh Quoc on 11/14/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWTableViewController.h"

@interface FOWDetailPostViewController : FOWTableViewController {
    NSMutableArray              *_dataSource;
    UITapGestureRecognizer      *_gesture;
}

@property (nonatomic, strong) UITapGestureRecognizer *gesture;

@end
