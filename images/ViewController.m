//
//  ViewController.m
//  images
//
//  Created by Иван on 6/1/19.
//  Copyright © 2019 Иван. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface CustomViewWithoutLabel : UIView
@property (nonatomic, strong) UIImage *originalImage;
@property(nonatomic,strong)NSString *title;
@end


@implementation CustomViewWithoutLabel

- (void)drawRect:(CGRect)rect
{
    [self.originalImage drawInRect:CGRectMake(0.f, 0.f, self.frame.size.width, self.frame.size.height)];
}


@end

@interface ViewController ()
@property(strong) CustomViewWithoutLabel *cust;
@property(assign) CGPoint touchOfSet;

@end

@implementation ViewController


- (void)moveDataTo1VC:(CustomView*)data {
    [self.navigationController popViewControllerAnimated:YES];
    CGSize sizeImg = CGSizeMake(160, 120);

    CustomViewWithoutLabel *customViewWithoutLabel = [[CustomViewWithoutLabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-sizeImg.width)/2, (self.view.frame.size.height-sizeImg.height)/2,sizeImg.width,sizeImg.height)];
    
    customViewWithoutLabel.originalImage = data.originalImage;
    customViewWithoutLabel.title = data.title;
    
    [self.view addSubview:customViewWithoutLabel];
    [self setTitle:data.title];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch =[touches anyObject];
    CGPoint pointOfTouch = [touch locationInView:self.view];
    CustomViewWithoutLabel *customViewWithoutLabel = [self.view hitTest:pointOfTouch withEvent:event];
    if(![customViewWithoutLabel isEqual:self.view]){
        self.cust = customViewWithoutLabel;
        self.title = _cust.title;
        [self.view bringSubviewToFront:self.cust];
        CGPoint touchPoint = [touch locationInView:self.cust];
        self.touchOfSet= CGPointMake(CGRectGetMidX(self.cust.bounds)-touchPoint.x, CGRectGetMidY(self.cust.bounds)-touchPoint.y);
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.cust.transform=CGAffineTransformMakeScale(1.05f, 1.05f);
                             self.cust.alpha= 0.7f;
                         }];
    }
    else{
        self.title =@"Images";
        self.cust = nil;
    }
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(self.cust){
        UITouch *touch = [touches anyObject];
        CGPoint pointOnMainView = [touch locationInView:self.view];
        CGPoint correction = CGPointMake(pointOnMainView.x+self.touchOfSet.x, pointOnMainView.y+self.touchOfSet.y);
        self.cust.center=correction;
    }
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  
    [UIView animateWithDuration:0.3 animations:^{
        self.cust.transform=CGAffineTransformIdentity;
         self.cust.alpha= 1.f;
    }];
      self.cust = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Images";
    self.navigationController.navigationBarHidden=NO;
    self.navigationController.toolbarHidden = YES;
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]
                           initWithTitle:@"Select Item"   style:UIBarButtonItemStylePlain
                           target:self  action:@selector(secondPage:)];
    self.navigationItem.rightBarButtonItem=item;
    
}

-(void)secondPage:(id)sender {
    
        ViewController2 *secondView=[[ViewController2 alloc] init];
        secondView.delegate = self;
    [self.navigationController pushViewController: secondView animated:YES];
}




@end
