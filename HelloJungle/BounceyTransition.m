//
//  BounceyTransition.m
//  HelloJungle
//
//  Created by Blake McMillian on 2/28/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "BounceyTransition.h"

@interface BounceyTransition ()

@end

@implementation BounceyTransition

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0f;
}

-(void) animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //Execute transition and Animate - (TODO)
    
    //Creating the "To" and "From" View Controller for the "animated transition"
    UIViewController *toVC = [transitionContext
                              viewControllerForKey:UITransitionContextToViewControllerKey];
//    UIViewController *fromVC = [transitionContext
//                                viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [[transitionContext containerView] addSubview:toVC.view];
    
    toVC.view.frame = CGRectMake(15, 492, 291, 460);
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
         usingSpringWithDamping:0.5f
          initialSpringVelocity:0.6f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.view.frame = CGRectMake(15, 54, 291, 460);}
                     completion:nil];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

@end
