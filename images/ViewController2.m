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
                        [UIImage imageNamed:@"image1"],
                        [UIImage imageNamed:@"image2"],
                         [UIImage imageNamed:@"image3"],
                         [UIImage imageNamed:@"image4"],
                         [UIImage imageNamed:@"image5"],
                         [UIImage imageNamed:@"image6"],
                         [UIImage imageNamed:@"image7"],
                        
                        nil];
    NSArray *example1 = [[NSArray alloc] initWithObjects:
                        @"image1",
                         @"image2",
                         @"image3",
                         @"image4",
                         @"image5",
                         @"image6",
                         @"image7",
                        
                        
                        nil];
    
    
    
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
            topAnchor+=cv.originalImage.size.height+20;
        } else {
            [NSLayoutConstraint activateConstraints:@[
                                                    //  [cv.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor],
                                                      [cv.topAnchor constraintEqualToAnchor:previousView.bottomAnchor constant:20],
                                                      [cv.heightAnchor constraintEqualToConstant:cv.originalImage.size.height],
                                                      [cv.widthAnchor constraintEqualToConstant:cv.originalImage.size.width]
                                                      ]];
            topAnchor+=cv.originalImage.size.height+20;
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
