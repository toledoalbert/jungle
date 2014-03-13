//
//  HomeViewController.h
//  HelloJungle
//
//  Created by Albert Toledo on 2/25/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlatUIKit.h"
#import "SwipeView.h"
#import "User.h"
#import "Feed.h"
#import "Post.h"
#import "NewPostView.h"
#import "BounceBehavior.h"
#import "ForceBounceBehavior.h"
#import "CustomSnapBehavior.h"

@interface HomeViewController : UIViewController

//Attributes for UI Elements
@property (strong, nonatomic) IBOutlet FUIButton *buttonNewPost;
@property (strong, nonatomic) IBOutlet FUIButton *buttonAnswerComment;
@property (strong, nonatomic) IBOutlet SwipeView *swipeView;
@property (strong, nonatomic) IBOutlet NewPostView *theNewPostView;


//Attributes Behaviors
@property (strong, nonatomic) BounceBehavior *bounce;
@property (strong, nonatomic) ForceBounceBehavior *forceBounce;
@property (strong, nonatomic) CustomSnapBehavior *snapComments;
@property (strong, nonatomic) UIDynamicItemBehavior *dynamicItem;
@property (strong, nonatomic) UICollisionBehavior *collision;


//Attributes for data
@property (strong, nonatomic) User *currentUser; //Most of the data will come from User's attributes.
@property (strong, nonatomic) Feed *usersFeed;
@property (strong, nonatomic) IBOutlet UILabel *labelQuestion;
@property (strong, nonatomic) IBOutlet UIImageView *postImage;

//Attributes actions
- (IBAction)segueToResponseView:(id)sender;
- (IBAction)segueToNewPostView:(id)sender;

//Attributes - Animator
@property (strong, nonatomic) UIDynamicAnimator *animator;

//Attributes gestures
- (IBAction)tapGesture:(id)sender;
- (IBAction)panGesture:(UIPanGestureRecognizer *)sender;




@end
