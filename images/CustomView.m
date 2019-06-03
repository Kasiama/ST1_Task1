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
        
        UILabel * descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
       descriptionLabel.textColor = [UIColor blackColor];
        descriptionLabel.tag = 14;
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
        descriptionLabel.adjustsFontSizeToFitWidth = YES;
        descriptionLabel.text = lbl;
        descriptionLabel.numberOfLines = 0;
        [self addSubview:descriptionLabel];
        
        [NSLayoutConstraint activateConstraints:@[
        [descriptionLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [descriptionLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [descriptionLabel.topAnchor constraintEqualToAnchor:self.bottomAnchor],
        [descriptionLabel.heightAnchor constraintEqualToConstant:40]
        ]];
        
    }
    return self;
}


@end
