//
//  ViewController.m
//  ContactSharing
//
//  Created by Sean Mullan on 3/20/16.
//  Copyright © 2016 SilentLupin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    mainImage = [[FramedImage alloc]initWithFrame:CGRectMake(self.view.width*0.2, self.view.height*0.13, self.view.width*0.6, self.view.width*0.6)];
    [mainImage setImage:[UIImage imageNamed:@"Face"]];
    [self.view addSubview:mainImage];
    
    name = [[UILabel alloc]initWithFrame:CGRectZero];
    name.text = @"Sean Mullan";
    name.font = [UIFont fontWithName:@"Baskerville" size:24];
    [name sizeToFit];
    [name setFrame:CGRectMake((self.view.width-name.width)/2, mainImage.bottomY+20, name.width, 20)];
    [self.view addSubview:name];
    
    menuButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 40, 40)];
    [menuButton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [self.view addSubview:menuButton];
    
    settingsButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.width-60, 20, 40, 40)];
    [settingsButton setImage:[UIImage imageNamed:@"settings"] forState:UIControlStateNormal];
    [self.view addSubview:settingsButton];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(void)SMSMessageSend{
    if(![MFMessageComposeViewController canSendText]){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"Failed To Send SMS."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    NSArray *recipients =  @[@"seanmm@mchsi.com"];
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc]init];
    messageController.messageComposeDelegate = self;
    [messageController setRecipients:recipients];
    
    CNMutableContact *newContact = [[CNMutableContact alloc]init];
    newContact.givenName = @"Mullano";
    newContact.familyName = @"Seano";
    NSArray* temp = @[newContact];
    NSData* card = [CNContactVCardSerialization dataWithContacts:temp error:nil];
    [messageController addAttachmentData:card typeIdentifier:@"public.vcard" filename:@"Tom Mullan.vcf"];
    
    [self presentViewController:messageController animated:YES completion:nil];
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{

    
    switch (result){
        case MessageComposeResultCancelled:
            [controller dismissViewControllerAnimated:YES completion:nil];
            break;
            
        case MessageComposeResultFailed:
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                           message:@"Failed To Send SMS."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
            [controller dismissViewControllerAnimated:YES completion:nil];
            break;
        }
        
        case MessageComposeResultSent:
            [controller dismissViewControllerAnimated:YES completion:nil];
            break;
            
        
        default:
            [controller dismissViewControllerAnimated:YES completion:nil];

            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
