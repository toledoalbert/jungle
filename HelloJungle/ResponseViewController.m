//
//  ResponseViewController.m
//  HelloJungle
//
//  Created by Blake McMillian on 2/26/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "ResponseViewController.h"
#import "SubResponseViewController.h"
#import "BounceyTransition.h"

@interface ResponseViewController ()

@end

@implementation ResponseViewController;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //Styling Homescreen button
    _returnToHomeScreen.buttonColor = [UIColor turquoiseColor];
    [_returnToHomeScreen setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    
    _returnToHomeScreen.buttonColor = [UIColor turquoiseColor];
    [_returnToHomeScreen setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnToHomeView:(id)sender
{
    //Poping a view controller from the navigation controller - (Returning to the homescreen)
    [self performSegueWithIdentifier: @"segueToHomeView" sender: self];
    
    
}
//Method that animates the view controller
- (void)animateViewController:(id)sender
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    SubResponseViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"subViewController"];
    
 //   SubResponseViewController *controller = [[SubResponseViewController alloc] initWithNibName:@"subViewController" bundle:nil];
    
    controller.view.backgroundColor = [UIColor blueColor];
    
    //Setting the modal Presentation style to Custom
    controller.modalPresentationStyle = UIModalPresentationCustom;
    
    //Adopting the UITransitioning Delegate protocols
    controller.transitioningDelegate = self;
    
    _commentSubViewController.hidden = YES;
    //Presenting the subresponse view controller into the current view controller "response"
    //The presentation will be animated and the completion condition will be set to "nil"
    [self presentViewController:controller
                       animated:YES
                     completion:nil];
    
    
    
}

-(id<UIViewControllerAnimatedTransitioning>)
animationControllerForPresentedController:(UIViewController *)presented
presentingController:(UIViewController *)
presenting sourceController:(UIViewController *)source
{
    //Creating a new bouncey transition object
    BounceyTransition *transition = [[BounceyTransition alloc] init];
    
    return transition;
}



/*Method - PrepareForSegue
Performing a segue to pass a reference of the subResponse View controller to
an attribute within the Response View Controlller 
 */
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"containerSegue"])
    {
        self.subResponseViewController = segue.destinationViewController;
        
    }

}
@end
