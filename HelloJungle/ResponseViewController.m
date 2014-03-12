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
#import "Math.h"

@interface ResponseViewController ()

@end

@implementation ResponseViewController;

@synthesize containerForComments;
@synthesize animator;
@synthesize viewComments;
@synthesize collision;
@synthesize push;
@synthesize attachement;
@synthesize gravity;
@synthesize snapComments;
@synthesize dynamicBehavior;

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
    
    //Create the gravity behavior
    gravity = [[UIGravityBehavior alloc] initWithItems:@[viewComments]];
    
    [gravity setGravityDirection:CGVectorMake(0.0, 1.0)];
    
    //Create the collision behavior
    collision = [[UICollisionBehavior alloc] initWithItems:@[viewComments]];
    
    [collision addBoundaryWithIdentifier:@"Ground"
                               fromPoint:CGPointMake(0.0f, 498.0f+471.0f)
                                 toPoint:CGPointMake(320.0f, 498.0f+471.0f)];
    
    //Create the snap for comments
    snapComments = [[UISnapBehavior alloc] initWithItem:viewComments snapToPoint:CGPointMake(160.0, 292.5)];
    snapComments.damping = 0.7;
    
	
    
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


- (IBAction)tapComments:(id)sender {
    
    //Create the push behavior
    push = [[UIPushBehavior alloc] initWithItems:@[viewComments] mode:UIPushBehaviorModeInstantaneous];
    
    [push setAngle:1.5*M_PI magnitude:15.0];
    
    //Create a push behavior with two UIViews and a continuous 'push' mode
    
    [animator addBehavior:push];
    
    [animator addBehavior:gravity];

    [animator addBehavior:collision];
    
}

- (IBAction)panComments:(UIPanGestureRecognizer *)sender {
    
    
    switch (sender.state){
            
        case UIGestureRecognizerStateBegan:{

            [animator removeAllBehaviors];
            break;
            
        }
        case UIGestureRecognizerStateChanged:{
            
            CGPoint translation = [sender translationInView:sender.view];
            sender.view.center = CGPointMake(sender.view.center.x,
                                             sender.view.center.y + translation.y);
            
        
            [sender setTranslation:CGPointMake(0, 0) inView:sender.view];
            
            NSLog(@"y:%f x:%f", sender.view.center.y, sender.view.center.x);
            
            
            //CGFloat xVelocity = [sender velocityInView:sender.view].x;
            //CGFloat yVelocity = [sender velocityInView:sender.view].y;
            
            //[dynamicBehavior addLinearVelocity:CGPointMake(xVelocity, yVelocity) forItem:sender.view];
            
            //[animator addBehavior:dynamicBehavior];
            
            
            break;
        
        }
        case UIGestureRecognizerStateEnded:{
            
            
            if(sender.view.center.y > 567.5){
            [collision addBoundaryWithIdentifier:@"Ground"
                                       fromPoint:CGPointMake(0.0f, 498.0f+471.0f)
                                         toPoint:CGPointMake(320.0f, 498.0f+471.0f)];

            
            [animator addBehavior:collision];
            [animator addBehavior:gravity];
            
            }
            else{
                
                [collision addBoundaryWithIdentifier:@"Left"
                                           fromPoint:CGPointMake(26.0f, 200.0f)
                                             toPoint:CGPointMake(26.0f, 800.0f)];
                
                [collision addBoundaryWithIdentifier:@"Right"
                                           fromPoint:CGPointMake(26.0f+268.0f, 200.0f)
                                             toPoint:CGPointMake(26.0f+268.0f, 800.0f)];
                
                
                [animator addBehavior:collision];

                
                [animator addBehavior:snapComments];
                
            }
            
            break;
            
        }
            
    }
    
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
