//
//  BounceyTransition.h
//  HelloJungle
//
//  Created by Blake McMillian on 2/28/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BounceyTransition : UIViewController<UIViewControllerAnimatedTransitioning>


//Attributes - Methods

//Method: Transition Duration
// - Setting the time duration for the transition
-(NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext;

//Method: animate Transition
// - Method where the animation and the transitions are executed
-(void) animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
