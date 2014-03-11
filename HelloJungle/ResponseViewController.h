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

//Attributes - Animator
@property (strong, nonatomic) UIDynamicAnimator *animator;

//Attributes - Container view
@property (strong, nonatomic) IBOutlet UIView *containerForComments;


//Attributes - Actions
- (IBAction)returnToHomeView:(id)sender;
- (IBAction)tapContainerForComments:(id)sender;
- (IBAction)pushContainer:(id)sender;

@end
