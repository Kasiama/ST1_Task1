//
//  ViewController2.m
//  images
//
//  Created by Иван on 6/1/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"
#import "CustomView.h"

@interface ViewController2 ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic)  CustomView *cv;
@end



@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Select Item";
    self.navigationController.toolbarHidden = YES;
    [self.navigationItem setHidesBackButton:YES animated:YES];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
   
    _scrollView.frame = self.view.frame;
    NSArray *example = [[NSArray alloc] initWithObjects:
                        [UIImage imageNamed:@"3067_2629425091_4b3430e48f_n_320_240_nofilter"],
                        [UIImage imageNamed:@"3613_3386665720_79c06fbbeb_320_240_nofilter"],
                         [UIImage imageNamed:@"3738_9235511808_67572aabbc_320_240_nofilter"],
                         [UIImage imageNamed:@"4811_32515851728_1156e823cc_320_240_nofilter"],
                         [UIImage imageNamed:@"4817_45073030565_9fcd298476_n_320_240_nofilter"],
                         [UIImage imageNamed:@"4819_44417693890_017be0d7e1_320_240_nofilter"],
                        
                         [UIImage imageNamed:@"4832_31112091957_e407e9b406_320_240_nofilter"],
                         [UIImage imageNamed:@"4841_46066484501_4476707991_320_240_nofilter"],
                         [UIImage imageNamed:@"4848_45556622474_4c32521ba3_320_240_nofilter"],
                        [UIImage imageNamed:@"4859_45342221014_62a96eb5b5_320_240_nofilter"],
                        
                        [UIImage imageNamed:@"4865_45556621784_84c4937234_320_240_nofilter"],
                        [UIImage imageNamed:@"4866_31045888077_073ee206eb_n_320_240_nofilter"],
                        [UIImage imageNamed:@"4875_31236282757_01ddb8a12b_n_320_240_nofilter"],
                        [UIImage imageNamed:@"7802_33155098668_43767977bf_n_320_240_nofilter"],
                        [UIImage imageNamed:@"7827_47037701381_a87e06a3c6_320_240_nofilter"],
                        
                        [UIImage imageNamed:@"7855_46881393484_491d1fba26_n_320_240_g"],
                        [UIImage imageNamed:@"7857_46621382411_9d1ea74e32_320_240_nofilter"],
                        [UIImage imageNamed:@"7881_47519179492_6238eb61b8_320_240_g"],
                        [UIImage imageNamed:@"7890_32558855308_3d974e0bf6_h_320_240_nofilter"],
                        [UIImage imageNamed:@"7924_46617754551_336d7643b7_320_240_nofilter"],
                        
                        [UIImage imageNamed:@"65535_32841428117_62490fcdd0_320_240_nofilter"],
                        [UIImage imageNamed:@"65535_40720662943_ca1493a024_320_240_nofilter"],
                        [UIImage imageNamed:@"65535_40725344203_96920b3cb1_320_240_nofilter"],
                        [UIImage imageNamed:@"65535_40759348343_6b168d5328_320_240_nofilter"],
                        [UIImage imageNamed:@"65535_46832338655_8b789f3b19_z_320_240_nofilter"],
                        [UIImage imageNamed:@"65535_47780391431_383c95704b_320_240_nofilter"],
                        
                        [UIImage imageNamed:@"65535_47936969547_d6291b21d2_n_320_240_g"],
                        [UIImage imageNamed:@"65535_47936969547_d6291b21d2_n_320_240_g"],
                        [UIImage imageNamed:@"65535_47955567951_ab9c44f8ca_320_240_nofilter"],
                        [UIImage imageNamed:@"65535_47958206718_c74b2c0afc_n_320_240_g"],
                        nil];
    NSArray *example1 = @[@"https://loremflickr.com/cache/resized/3067_2629425091_4b3430e48f_n_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/3613_3386665720_79c06fbbeb_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/3738_9235511808_67572aabbc_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/4811_32515851728_1156e823cc_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/4817_45073030565_9fcd298476_n_320_240_nofilter.jpg",
                          
                             @"https://loremflickr.com/cache/resized/4819_44417693890_017be0d7e1_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/4832_31112091957_e407e9b406_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/4841_46066484501_4476707991_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/4848_45556622474_4c32521ba3_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/4859_45342221014_62a96eb5b5_320_240_nofilter.jpg",
                          
                             @"https://loremflickr.com/cache/resized/4865_45556621784_84c4937234_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/4866_31045888077_073ee206eb_n_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/4875_31236282757_01ddb8a12b_n_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/7802_33155098668_43767977bf_n_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/7827_47037701381_a87e06a3c6_320_240_nofilter.jpg",
                          
                             @"https://loremflickr.com/cache/resized/7855_46881393484_491d1fba26_n_320_240_g.jpg",
                             @"https://loremflickr.com/cache/resized/7857_46621382411_9d1ea74e32_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/7881_47519179492_6238eb61b8_320_240_g.jpg",
                             @"https://loremflickr.com/cache/resized/7890_32558855308_3d974e0bf6_h_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/7924_46617754551_336d7643b7_320_240_nofilter.jpg",
                          
                             @"https://loremflickr.com/cache/resized/65535_32841428117_62490fcdd0_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/65535_40720662943_ca1493a024_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/65535_40725344203_96920b3cb1_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/65535_40759348343_6b168d5328_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/65535_46832338655_8b789f3b19_z_320_240_nofilter.jpg",
                          
                             @"https://loremflickr.com/cache/resized/65535_47780391431_383c95704b_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/65535_47936969547_d6291b21d2_n_320_240_g.jpg",
                             @"https://loremflickr.com/cache/resized/65535_47939975498_898fb21def_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/65535_47955567951_ab9c44f8ca_320_240_nofilter.jpg",
                             @"https://loremflickr.com/cache/resized/65535_47958206718_c74b2c0afc_n_320_240_g.jpg"];
    
    
    
    UIView *previousView = nil;
    //_scrollView.contentSize =CGSizeMake(self.view.frame.size.width,200*7 );
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
                                              [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
                                              [self.scrollView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
                                              [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
                                              ]
     ];
    float topAnchor = 0;
    for(int i =0;i<example.count;i++){
        CustomView *cv = [[CustomView alloc] initWithFrame:CGRectZero withImage:[example objectAtIndex:i] withLabel:[example1 objectAtIndex:i]];
    cv.backgroundColor = [UIColor greenColor];
    cv.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:cv];
        [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:cv attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [self addCustomViewGestureRecognizer:cv];
        
        if (previousView == nil) {
            [NSLayoutConstraint activateConstraints:@[
                                                    //  [cv.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor],
                                                      [cv.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
                                                      [cv.heightAnchor constraintEqualToConstant:cv.originalImage.size.height],
                                                      [cv.widthAnchor constraintEqualToConstant:cv.originalImage.size.width]
                                                      ]];
            topAnchor+=cv.originalImage.size.height+40;
        } else {
            [NSLayoutConstraint activateConstraints:@[
                                                    //  [cv.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor],
                                                      [cv.topAnchor constraintEqualToAnchor:previousView.bottomAnchor constant:40],
                                                      [cv.heightAnchor constraintEqualToConstant:cv.originalImage.size.height],
                                                      [cv.widthAnchor constraintEqualToConstant:cv.originalImage.size.width]
                                                      ]];
            topAnchor+=cv.originalImage.size.height+40;
        }
        
    previousView = cv;
        
    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, topAnchor);
    
    
}
-(void)back:(id)sender {
   [self.navigationController popViewControllerAnimated:YES];
}
- (void)addCustomViewGestureRecognizer:(CustomView *)cv {
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [cv addGestureRecognizer:singleFingerTap];
}
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    [_delegate moveDataTo1VC:(CustomView *)recognizer.view];
    
}


@end
