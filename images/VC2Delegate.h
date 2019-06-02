//
//  VC2Delegate.h
//  images
//
//  Created by Иван on 6/2/19.
//  Copyright © 2019 Иван. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "CustomView.h"

@protocol VC2Delegate <NSObject>

@required
- (void)moveDataTo1VC:(CustomView*)data;
@end
