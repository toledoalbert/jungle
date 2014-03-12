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
@property (strong, nonatomic) IBOutlet UIView *viewComments;

//Attributes - Behaviors
@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UIAttachmentBehavior *attachement;
@property (strong, nonatomic) UICollisionBehavior *collision;
@property (strong, nonatomic) UIPushBehavior *push;
@property (strong, nonatomic) UIDynamicItemBehavior *dynamicBehavior;
@property (strong, nonatomic) UISnapBehavior *snapComments;


//Attributes - Actions
- (IBAction)returnToHomeView:(id)sender;
- (IBAction)tapComments:(id)sender;
- (IBAction)panComments:(UIPanGestureRecognizer *)sender;

@end
