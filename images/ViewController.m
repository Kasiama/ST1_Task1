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
    [self.originalImage drawInRect:CGRectMake(0.f, 0.f, self.originalImage.size.width, self.originalImage.size.height)];

}

@end

@interface ViewController ()
@property (strong) ViewController2 *secondViewController;
@property (strong) NSMutableArray *draggingImages;
@property(strong) CustomViewWithoutLabel *cust;
@property(assign) CGPoint touchOfSet;

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
    CustomViewWithoutLabel *cmwl = [[CustomViewWithoutLabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2,data.originalImage.size.width,data.originalImage.size.height)];
    
    cmwl.originalImage = data.originalImage;
    cmwl.title = data.title;
   // [cmwl addGestureRecognizer:pan];
   // [cmwl addGestureRecognizer:tap];
    
    [self.view addSubview:cmwl];
    //[self setCustomViewConstraints:data];
    [self setTitle:data.title];
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    CustomViewWithoutLabel *cmwl = (CustomViewWithoutLabel *)recognizer.view;
    self.title = cmwl.title;
    [self.view bringSubviewToFront:cmwl];
    CGPoint translatedPoint = [recognizer translationInView:cmwl.superview];
    CGPoint location = [recognizer locationInView:cmwl.superview];
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        cmwl.center = location;
    }
    cmwl.center = CGPointMake(cmwl.center.x + translatedPoint.x, cmwl.center.y +translatedPoint.y);
    [recognizer setTranslation:CGPointZero inView:cmwl.superview];
}
- (void)handleTap:(UITapGestureRecognizer *)recognizer {
    CustomViewWithoutLabel *draggingView = (CustomViewWithoutLabel *)recognizer.view;
    self.title = draggingView.title;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch =[touches anyObject];
    CGPoint poi = [touch locationInView:self.view];
    CustomViewWithoutLabel *view = [self.view hitTest:poi withEvent:event];
    if(![view isEqual:self.view]){
        self.cust = view;
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
        self.title =@"title";
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
