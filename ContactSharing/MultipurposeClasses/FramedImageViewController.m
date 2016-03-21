//
//  FramedImageViewController.m
//  ContactSharing
//
//  Created by Sean Mullan on 3/20/16.
//  Copyright © 2016 SilentLupin. All rights reserved.
//

#import "FramedImageViewController.h"

@interface FramedImageViewController ()

@end

@implementation FramedImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadView:(CGRect)frame{
    self.view = [[UIView alloc]initWithFrame:frame];
    self.view.backgroundColor = [UIColor clearColor];
}

-(void)setImage:(UIImage*)newImage inFrame:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.alpha = 1;
    view.backgroundColor = [UIColor whiteColor];
    _border = [CAShapeLayer layer];
    [_border setPath:[[UIBezierPath bezierPathWithOvalInRect:view.bounds] CGPath]];
    [_border setStrokeColor:[[UIColor blackColor]CGColor]];
    [_border setFillColor:[[UIColor clearColor]CGColor]];
    _border.lineWidth = 2.0f;
    [view.layer addSublayer:_border];
    
    view.layer.cornerRadius = frame.size.width/2;
    
    UIImageView* newImageView = [[UIImageView alloc]initWithImage:newImage];
    newImageView.contentMode = UIViewContentModeScaleAspectFit;
    [newImageView setClipsToBounds:YES];
    [newImageView setFrame: CGRectMake(0, 0, view.width, view.height)];
    newImageView.layer.cornerRadius = view.frame.size.width/2;
    [view addSubview:newImageView];
    
    [self.view addSubview:view];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
