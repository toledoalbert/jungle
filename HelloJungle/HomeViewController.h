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

@interface HomeViewController : UIViewController

//Attributes for UI Elements
@property (strong, nonatomic) IBOutlet FUIButton *buttonNewPost;
@property (strong, nonatomic) IBOutlet FUIButton *buttonAnswerComment;
@property (strong, nonatomic) IBOutlet SwipeView *swipeView;

//Attributes for data
@property (strong, nonatomic) User *currentUser; //Most of the data will come from User's attributes.
@property (strong, nonatomic) Feed *usersFeed;


@end
