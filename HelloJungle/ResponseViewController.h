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

@interface ResponseViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    //Attributes - Array
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

@property (nonatomic,strong) NSArray *commentItems;

//Attributes - Behaviors
@property (strong, nonatomic) BounceBehavior *bounce;
@property (strong, nonatomic) ForceBounceBehavior *forceBounce;
@property (strong, nonatomic) CustomSnapBehavior *snapComments;
@property (strong, nonatomic) UIDynamicItemBehavior *dynamicItem;
@property (strong, nonatomic) UICollisionBehavior *collision;
@property (strong, nonatomic) UIView *shadowView;

//Attributes - Actions
- (IBAction)returnToHomeView:(id)sender;
- (IBAction)tapComments:(id)sender;
- (IBAction)panComments:(UIPanGestureRecognizer *)sender;

//Attributes - TableView methods
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;

//Attributes - Initializing the Nib
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (void)awakeFromNib;

//Attributes - TextField method
- (BOOL)textFieldShouldReturn:(UITextField *)textField;

//Method
-(void)appendElementsToArray:(NSString *)inputString;


@end
