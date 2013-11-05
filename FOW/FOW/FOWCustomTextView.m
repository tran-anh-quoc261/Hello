//
//  FOWCustomTextView.m
//  FOW
//
//  Created by Anh Quoc on 11/4/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWCustomTextView.h"

@interface FOWCustomTextView()
- (void) _initialize;
- (void) _updateShouldDrawPlaceholder;
- (void) _textChanged:(NSNotification *) notification;
@end

@implementation FOWCustomTextView
@synthesize placeholder = _placeholder;
@synthesize placeholderColor = _placeholderColor;

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initialize];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _initialize];
    }
    return self;
}

- (void) drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (_shouldDrawPlaceholder) {
        [_placeholderColor set];
        [_placeholder drawInRect:CGRectMake(8.0f, 8.0f, self.frame.size.width - 16.0f, self.frame.size.height - 16.0f) withFont:self.font];
    }
}

- (void) setText:(NSString *)text {
    [super setText:text];
    [self _updateShouldDrawPlaceholder];
}

- (void) setPlaceholder:(NSString *)string {
    if ([string isEqualToString:_placeholder]) {
        return;
    }
//    [_placeholder release];
//    _placeholder = [string retain];
    [self _updateShouldDrawPlaceholder];
}


- (void) _initialize {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_textChanged:) name:UITextViewTextDidChangeNotification object:self];
    self.placeholderColor = [UIColor colorWithWhite:0.702f alpha:1.0f];
    _shouldDrawPlaceholder = NO;
}

- (void) _updateShouldDrawPlaceholder {
    BOOL prev = _shouldDrawPlaceholder;
    _shouldDrawPlaceholder = self.placeholder && self.placeholderColor && [self.text length] ==0;
    if (prev != _shouldDrawPlaceholder) {
        [self setNeedsDisplay];
    }
}

- (void) _textChanged:(NSNotification *)notification {
    [self _updateShouldDrawPlaceholder];
}




@end
