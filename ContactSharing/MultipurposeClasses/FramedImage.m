//
//  FramedImage.m
//  ContactSharing
//
//  Created by Sean Mullan on 3/20/16.
//  Copyright © 2016 SilentLupin. All rights reserved.
//

#import "FramedImage.h"

@implementation FramedImage

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.alpha = 1;
    self.backgroundColor = [UIColor whiteColor];
    _border = [CAShapeLayer layer];
    [_border setPath:[[UIBezierPath bezierPathWithOvalInRect:self.bounds] CGPath]];
    [_border setStrokeColor:[[UIColor blackColor]CGColor]];
    [_border setFillColor:[[UIColor clearColor]CGColor]];
    _border.lineWidth = 2.0f;
    [self.layer addSublayer:_border];
    
    self.layer.cornerRadius = frame.size.width/2;

    return self;
}

-(void)setImage:(UIImage*)newImage{
    UIImageView* newImageView = [[UIImageView alloc]initWithImage:newImage];
    newImageView.contentMode = UIViewContentModeScaleAspectFit;
    [newImageView setClipsToBounds:YES];
    [newImageView setFrame: CGRectMake(0, 0, self.width, self.height)];
    newImageView.layer.cornerRadius = self.frame.size.width/2;
    [self addSubview:newImageView];
}

@end
