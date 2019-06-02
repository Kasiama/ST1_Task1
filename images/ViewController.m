//
//  ViewController.m
//  images
//
//  Created by Иван on 6/1/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"



@interface ViewController ()
@property (strong) ViewController2 *secondViewController;
@property (strong) NSMutableArray *draggingImages;

@end

@implementation ViewController

- (void)moveDataTo1VC:(CustomView*)data {
    [self.navigationController popViewControllerAnimated:YES];
    
    UIPanGestureRecognizer *pan =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handlePan:)];
    UITapGestureRecognizer *tap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleTap:)];
    [data addGestureRecognizer:pan];
    [data addGestureRecognizer:tap];
    
    [self.view addSubview:data];
    //[self setCustomViewConstraints:data];
    [self setTitle:data.title];
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    CustomView *draggingView = (CustomView *)recognizer.view;
    self.title = draggingView.title;
    [self.view bringSubviewToFront:draggingView];
    CGPoint translatedPoint = [recognizer translationInView:draggingView.superview];
    CGPoint location = [recognizer locationInView:draggingView.superview];
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        draggingView.center = location;
    }
    draggingView.center = CGPointMake(draggingView.center.x + translatedPoint.x, draggingView.center.y +translatedPoint.y);
    [recognizer setTranslation:CGPointZero inView:draggingView.superview];
}
- (void)handleTap:(UITapGestureRecognizer *)recognizer {
    CustomView *draggingView = (CustomView *)recognizer.view;
    self.title = draggingView.title;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"title";
    self.navigationController.navigationBarHidden=NO;
    self.navigationController.toolbarHidden = YES;
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]
                           initWithTitle:@"next view"   style:UIBarButtonItemStylePlain
                           target:self  action:@selector(secondPage:)];
    self.navigationItem.rightBarButtonItem=item;
    
}

-(void)secondPage:(id)sender {
    
        ViewController2 *secondView=[[ViewController2 alloc] init];
        self.secondViewController=secondView;
        secondView.delegate = self;
    [self.navigationController pushViewController: secondView animated:YES];
}




@end
