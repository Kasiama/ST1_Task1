//
//  ViewController2.m
//  images
//
//  Created by Иван on 6/1/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"second View";
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
                        nil];
    
    for(int i =0;i<example.count;i++){
        
        UIImageView *iv = [[UIImageView alloc] initWithImage:[example objectAtIndex:i]];
    
        iv.frame = CGRectMake(20, 130*i, iv.frame.size.width, iv.frame.size.height);
       
        [_scrollView addSubview:iv];
        
       // _scrollView.delegate= self;
    }
    _scrollView.contentSize =CGSizeMake(self.view.frame.size.width,130*6 );
    
}
-(void)back:(id)sender {
   [self.navigationController popViewControllerAnimated:YES];
}

@end
