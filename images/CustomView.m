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
        // Initialization code
        _originalImage = img;
        _title = lbl;
        [self drawRect:frame];
        [self setBackgroundColor:[UIColor whiteColor]];
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - 50, frame.size.width,30)];
        label1.text = lbl;
        label1.textColor = [UIColor blackColor];
        [self addSubview:label1];
    }
    return self;
}


@end
