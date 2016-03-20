//
//  UIView+Points.m
//  ContactSharing
//
//  Created by Sean Mullan on 3/20/16.
//  Copyright © 2016 SilentLupin. All rights reserved.
//

#import "UIView+Points.h"

@implementation UIView (points)

//X coordinates
-(float)rightX{
    return self.frame.origin.x+self.frame.size.width;
}
-(float)midX{
    return self.frame.origin.x+self.frame.size.width/2;
}
-(float)leftX{
    return self.frame.origin.x;
}

//Y coordinates
-(float)bottomY{
    return self.frame.origin.y+self.frame.size.height;
}
-(float)midY{
    return self.frame.origin.y+self.frame.size.height/2;
}
-(float)topY{
    return self.frame.origin.y;
}

//Center point
-(CGPoint)center{
    return CGPointMake(self.frame.origin.x+self.frame.size.width/2, self.frame.origin.y+self.frame.size.height/2);
}

//Corner points
-(CGPoint) topRight{
    return CGPointMake(self.frame.origin.x+self.frame.size.width, self.frame.origin.y+self.frame.size.height);
}
-(CGPoint) topLeft{
    return CGPointMake(self.frame.origin.x,self.frame.origin.y+self.frame.size.height);
}
-(CGPoint) bottomRight{
    return CGPointMake(self.frame.origin.x+self.frame.size.width,self.frame.origin.y);
}
-(CGPoint) bottomLeft{
    return self.frame.origin;
}

//simplified metrics
-(float)width{
    return self.frame.size.width;
}
-(float)height{
    return self.frame.size.height;
}
@end
