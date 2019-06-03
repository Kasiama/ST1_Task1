//
//  CustomView.m
//  images
//
//  Created by Иван on 6/2/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (void)drawRect:(CGRect)rect
{
   [self.originalImage drawInRect:CGRectMake(0.f, 0.f, self.originalImage.size.width, self.originalImage.size.height)];
    
}
- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)img withLabel:(NSString *)lbl
{
    self = [super initWithFrame:frame];
    if (self) {
        _originalImage = img;
        _title = lbl;
        [self drawRect:frame];
        [self setBackgroundColor:[UIColor whiteColor]];
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectZero];
       label1.textColor = [UIColor blackColor];
        label1.tag = 14;
        label1.translatesAutoresizingMaskIntoConstraints = NO;
        label1.adjustsFontSizeToFitWidth = YES;
        label1.text = lbl;
        label1.numberOfLines = 0;
        [self addSubview:label1];
        
        [NSLayoutConstraint activateConstraints:@[
        [label1.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [label1.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [label1.topAnchor constraintEqualToAnchor:self.bottomAnchor],
        [label1.heightAnchor constraintEqualToConstant:40]
        ]];
        
    }
    return self;
}


@end
