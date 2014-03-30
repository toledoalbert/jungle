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
#import "CommentsView.h"
#import "CustomTableViewCell.h"

@interface HomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    //Attributes - Array
    CGPoint nowPosition;
    float alpha;
    CGPoint lastPosition;
    float new_alpha;
    CGFloat currentPosition;
}

//ResponseView Merge
@property (strong, nonatomic) IBOutlet CommentsView *viewComments;

//Attributes - Behaviors
@property (strong, nonatomic) BounceBehavior *bounceNewPost;
@property (strong, nonatomic) ForceBounceBehavior *forceBounceNewPost;
@property (strong, nonatomic) CustomSnapBehavior *snapNewPost;
@property (strong, nonatomic) UIDynamicItemBehavior *dynamicItemNewPost;
@property (strong, nonatomic) UICollisionBehavior *collisionNewPost;
@property (strong, nonatomic) UIView *shadowView;

//Array
@property (nonatomic,strong) NSArray *commentItems;











//Attributes for UI Elements
@property (strong, nonatomic) IBOutlet SwipeView *swipeView;
@property (strong, nonatomic) IBOutlet NewPostView *theNewPostView;


//Attributes Behaviors/

@property (strong, nonatomic) BounceBehavior *bounceComments;
@property (strong, nonatomic) ForceBounceBehavior *forceBounceComments;
@property (strong, nonatomic) CustomSnapBehavior *snapComments;
@property (strong, nonatomic) UIDynamicItemBehavior *dynamicItemComments;
@property (strong, nonatomic) UICollisionBehavior *collisionComments;



//Attributes for data
@property (strong, nonatomic) User *currentUser; //Most of the data will come from User's attributes.
@property (strong, nonatomic) Feed *usersFeed;
@property (strong, nonatomic) IBOutlet UIImageView *postImage;
@property (strong, nonatomic) IBOutlet UITextView *postText;


//Attributes actions
- (IBAction)segueToResponseView:(id)sender;
//- (IBAction)segueToNewPostView:(id)sender;

//Attributes - Animator
@property (strong, nonatomic) UIDynamicAnimator *animator;
//@property (strong, nonatomic) UIDynamicAnimator *animatorNewPost;
//@property (strong, nonatomic) UIDynamicAnimator *animatorMain;

//Attributes gestures
- (IBAction)tapGesture:(id)sender;
- (IBAction)panGesture:(UIPanGestureRecognizer *)sender;
- (IBAction)commentTapGesture:(UITapGestureRecognizer *)sender;
- (IBAction)commentPanGesture:(UIPanGestureRecognizer *)sender;




@end
