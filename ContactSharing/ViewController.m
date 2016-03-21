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
    
    NSArray* images = @[[UIImage imageNamed:@"Face"],[UIImage imageNamed:@"Face"],[UIImage imageNamed:@"Face"]];
    NSMutableArray* temp = [[NSMutableArray alloc]initWithCapacity:images.count];
    for(int i = 0; i<images.count; i++){
        FramedImageViewController *framedImage = [[FramedImageViewController alloc]init];
        [framedImage loadView:CGRectMake(0, 0, self.view.width, self.view.width*0.6)];
        [framedImage setImage:[images objectAtIndex:i] inFrame:CGRectMake(self.view.width*0.2, 2, self.view.width*0.6, self.view.width*0.6-4)];
        framedImage.index = i;
        [temp addObject:framedImage];
    }
    profiles = [NSArray arrayWithArray:temp];
    
    greyStripe = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.height*0.13, self.view.width, self.view.width*0.6)];
    greyStripe.backgroundColor = [UIColor grayColor];
    [self.view addSubview:greyStripe];
    
    pageController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    pageController.dataSource = self;
    pageController.delegate = self;
    pageController.view.backgroundColor = [UIColor clearColor];
    [[pageController view] setFrame:CGRectMake(0, self.view.height*0.13, self.view.width, self.view.width*0.6)];

    NSArray *viewControllers = [NSArray arrayWithObject:[profiles objectAtIndex:0]];
    [pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self addChildViewController:pageController];
    [[self view]addSubview:pageController.view];
    [pageController didMoveToParentViewController:self];
    
    name = [[UILabel alloc]initWithFrame:CGRectZero];
    name.text = @"Sean Mullan";
    name.font = [UIFont fontWithName:@"Baskerville" size:24];
    [name setFrame:CGRectMake(0, pageController.view.bottomY+25, self.view.width, 20)];
    name.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:name];
    
    menuButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 40, 40)];
    [menuButton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [self.view addSubview:menuButton];
    
    settingsButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.width-60, 20, 40, 40)];
    [settingsButton setImage:[UIImage imageNamed:@"settings"] forState:UIControlStateNormal];
    [self.view addSubview:settingsButton];
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSInteger index = [(FramedImageViewController*)viewController index];
    index++;
    if(index>=profiles.count){
        return nil;
    }
    return [profiles objectAtIndex:index];
}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSInteger index = [(FramedImageViewController*)viewController index];
    index--;
    if(index<0){
        return nil;
    }
    return [profiles objectAtIndex:index];
}

-(void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers{
    NSInteger index = [(FramedImageViewController*)[pendingViewControllers objectAtIndex:0] index];
    name.text = [NSString stringWithFormat:@"Sean Mullan %ld",(long)index];
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
