//
//  ViewController2.h
//  images
//
//  Created by Иван on 6/1/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"VC2Delegate.h"



@interface ViewController2 : UIViewController
@property (nonatomic, weak) id<VC2Delegate> delegate;
@end


