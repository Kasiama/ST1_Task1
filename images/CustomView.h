//
//  CustomView.h
//  images
//
//  Created by Иван on 6/2/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomView : UIView
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *originalImage;
- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)img withLabel:(NSString *)lbl ;
@end

NS_ASSUME_NONNULL_END
