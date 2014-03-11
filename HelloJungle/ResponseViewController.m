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

@synthesize containerForComments;
@synthesize animator;

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
    
    //Initialize the animator
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

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

- (IBAction)tapContainerForComments:(id)sender {
    
    NSLog(@"Tap occured");
    
    self.view.backgroundColor = [UIColor blueColor];
    
    // Create a push behavior with two UIViews and a continuous 'push' mode
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[containerForComments] mode:UIPushBehaviorModeInstantaneous];
    
    [animator addBehavior:push];
    
    // Set an angle and magnitude
    [push setAngle:1.6 magnitude:0.5];
    
    
}

- (IBAction)pushContainer:(id)sender {
    
    // Create a push behavior with two UIViews and a continuous 'push' mode
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[containerForComments] mode:UIPushBehaviorModeInstantaneous];
    
    [animator addBehavior:push];
    
    // Set an angle and magnitude
    [push setAngle:1.6 magnitude:0.5];
    
}


/*Method - PrepareForSegue
Performing a segue to pass a reference of the subResponse View controller to
an attribute within the Response View Controlller 
 */
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"containerSegue"])
    {
        
        
    }

}



@end
