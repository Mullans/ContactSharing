//
//  ViewController.h
//  ContactSharing
//
//  Created by Sean Mullan on 3/20/16.
//  Copyright © 2016 SilentLupin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Points.h"
#import "FramedImage.h"
@import Contacts;
@import MessageUI;
@interface ViewController : UIViewController{
    FramedImage* mainImage;
    UILabel* name;
    UIButton* settingsButton;
    UIButton* menuButton;
    UIButton* profileButton;
    UIButton* recipientButton;
}

-(void)SMSMessageSend;

@end

