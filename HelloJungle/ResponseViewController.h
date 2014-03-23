//
//  ResponseViewController.h
//  HelloJungle
//
//  Created by Blake McMillian on 2/26/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlatUIKit.h"
#import "BounceBehavior.h"
#import "CustomSnapBehavior.h"
#import "ForceBounceBehavior.h"
#import "CommentsView.h"
#import "CustomTableViewCell.h"
#import "AppDelegate.h"

@interface ResponseViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    //Attributes - Array
    NSArray *items;
    CGPoint nowPosition;
    float alpha;
    CGPoint lastPosition;
    float new_alpha;
    CGFloat currentPosition;
}

//Attributes - Buttons
@property (weak, nonatomic) IBOutlet FUIButton *returnToHomeScreen;

//Attributes - Animator
@property (strong, nonatomic) UIDynamicAnimator *animator;

//Attributes - View for comments
@property (strong, nonatomic) IBOutlet CommentsView *viewComments;

@property (nonatomic,strong) NSArray *arrItems;




//Attributes - Behaviors
@property (strong, nonatomic) BounceBehavior *bounce;
@property (strong, nonatomic) ForceBounceBehavior *forceBounce;
@property (strong, nonatomic) CustomSnapBehavior *snapComments;
@property (strong, nonatomic) UIDynamicItemBehavior *dynamicItem;
@property (strong, nonatomic) UICollisionBehavior *collision;
@property (strong, nonatomic) IBOutlet UIView *shadowView;

//Attributes - Actions
- (IBAction)returnToHomeView:(id)sender;
- (IBAction)tapComments:(id)sender;
- (IBAction)panComments:(UIPanGestureRecognizer *)sender;

@end
