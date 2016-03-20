//
//  UIView+Points.h
//  ContactSharing
//
//  Created by Sean Mullan on 3/20/16.
//  Copyright © 2016 SilentLupin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (points)
@property (nonatomic, readonly) float rightX;
@property (nonatomic, readonly) float midX;
@property (nonatomic, readonly) float leftX;
@property (nonatomic, readonly) float topY;
@property (nonatomic, readonly) float midY;
@property (nonatomic, readonly) float bottomY;
@property (nonatomic, readonly) float height;
@property (nonatomic, readonly) float width;
@property (nonatomic, readonly) CGPoint center;
@property (nonatomic, readonly) CGPoint topRight;
@property (nonatomic, readonly) CGPoint topLeft;
@property (nonatomic, readonly) CGPoint bottomRight;
@property (nonatomic, readonly) CGPoint bottomLeft;
@end
