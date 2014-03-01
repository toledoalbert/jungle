//
//  ResponseViewController.h
//  HelloJungle
//
//  Created by Blake McMillian on 2/26/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlatUIKit.h"
#import "SubResponseViewController.h"


@interface ResponseViewController : UIViewController<UIViewControllerTransitioningDelegate>

//Attributes - Buttons
@property (weak, nonatomic) IBOutlet FUIButton *returnToHomeScreen;

//Attributes - Segues


//Attributes - Container view
@property (weak, nonatomic) IBOutlet UIView *commentSubViewController;

//Attributes - View Controllers
@property (strong, nonatomic) UIViewController *subResponseViewController;

//Attributes - Actions
- (IBAction)returnToHomeView:(id)sender;
- (void)animateViewController:(id)sender;

//Method - Animations
-(id<UIViewControllerAnimatedTransitioning>)
animationControllerForPresentedController:(UIViewController *)presented
                     presentingController:(UIViewController *)
              presenting sourceController:(UIViewController *)source;

@end
