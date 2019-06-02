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
    [self.view addSubview:data];
    //[self setCustomViewConstraints:data];
    [self setTitle:data.title];
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
