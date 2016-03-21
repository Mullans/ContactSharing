//
//  FramedImageViewController.h
//  ContactSharing
//
//  Created by Sean Mullan on 3/20/16.
//  Copyright © 2016 SilentLupin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Points.h"
@interface FramedImageViewController : UIViewController
@property CAShapeLayer* border;
@property NSInteger index;
-(void)setImage:(UIImage*)newImage inFrame:(CGRect)frame;
-(void)loadView:(CGRect)frame;
@end
