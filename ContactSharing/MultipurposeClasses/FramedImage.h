//
//  FramedImage.h
//  ContactSharing
//
//  Created by Sean Mullan on 3/20/16.
//  Copyright © 2016 SilentLupin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Points.h"
@interface FramedImage : UIView
@property CAShapeLayer* border;
-(void)setImage:(UIImage*)newImage;
@end
