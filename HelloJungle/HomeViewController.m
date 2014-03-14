//
//  HomeViewController.m
//  HelloJungle
//
//  Created by Albert Toledo on 2/25/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "HomeViewController.h"
#import "FlatUIKit.h"
#import "SwipeView.h"
#import "NewPostView.h"
#import "BounceBehavior.h"
#import "CustomSnapBehavior.h"
#import "ForceBounceBehavior.h"

@implementation HomeViewController

//Synthesize all the properties for the viewcontroller
@synthesize theNewPostView;
@synthesize animator;
@synthesize forceBounce;
@synthesize bounce;
@synthesize snapComments;
@synthesize dynamicItem;
@synthesize collision;

//Init with nib name method, not used at the moment
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

//View did load, this is where shit happens.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //This was a test object. Tested successfully with Parse.
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    
    ////////SAMPLE DATA/////////
    Post *post1 = [[Post alloc] init];
    post1.user =  [[User alloc] init];
    post1.image = [UIImage imageNamed:@"Pink.jpg"];
    post1.content = @"Where is Post1?";
    
    Post *post2 = [[Post alloc] init];
    post2.user =  [[User alloc] init];
    post2.image = [UIImage imageNamed:@"Orange.jpg"];
    post2.content = @"Where is Post2?";
    
    Post *post3 = [[Post alloc] init];
    post3.user =  [[User alloc] init];
    post3.image = [UIImage imageNamed:@"Green.jpg"];
    post3.content = @"Where is Post3?";
    
    Post *post4 = [[Post alloc] init];
    post4.user =  [[User alloc] init];
    post4.image = [UIImage imageNamed:@"Yellow.jpg"];
    post4.content = @"Where is Post4?";
    

    //Initialize the usersFeed and set the values for its attributes.
    //These initializations will be done with values retrieved from Parse
    //in the future
    _usersFeed = [[Feed alloc] init];
    _usersFeed.posts = [[NSArray alloc] initWithObjects:post1, post2, post3, post4, nil];
    
    
    
    ////////////////END SAMPLE DATA CREATION/////////////////
    
    
	//Style the buttons.
     _buttonNewPost.buttonColor = [UIColor turquoiseColor];
    [_buttonNewPost setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    
    _buttonAnswerComment.buttonColor = [UIColor turquoiseColor];
    [_buttonAnswerComment setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    
    //configure swipe view
    _swipeView.alignment = SwipeViewAlignmentCenter;
    _swipeView.pagingEnabled = YES;
    _swipeView.itemsPerPage = 1;
    
    
    //Initialize the animator
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    //Initialize the bounce behavior
    bounce = [[BounceBehavior alloc] initWithItems:@[theNewPostView]];
    
    //set the gravity for bounce
    [bounce setGravityWithDirection:0.0 andMagnitude:-1.0];
    
    //set the collision border for bounce
    [bounce addBorderhWithIdentifer:@"Ground"
                          fromPoint:CGPointMake(0.0f, 498.0f+471.0f)
                            toPoint:CGPointMake(320.0f, 498.0f+471.0f)];
    
    //Initialize the custom snap for comments
    snapComments = [[CustomSnapBehavior alloc] initWithItem:theNewPostView
                                             andSnaptoPoint:CGPointMake(160.0, 292.5)];
    
    //Set the damping for the snap
    [snapComments setDamping:1.2];
    
    //Create collision for snap
    collision = [[UICollisionBehavior alloc] initWithItems:@[theNewPostView]];
    
    //Create the forceBounce behavior
    forceBounce = [[ForceBounceBehavior alloc] initWithItems:@[theNewPostView]];
    
    //Add the gravity properties
    [forceBounce setGravityWithDirection:-1.5*M_PI andMagnitude:15.0];
    
    
}

//This method returns a number which will determine how many spots the swipe view will have.
- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    //Return the number of posts from the posts array's size of the feed.
    return _usersFeed.posts.count; //This number will be retrieved from Parse in the future.
}

//This is the method where the view for each spot in the swipe view is set by index number.
- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    
    //Get the data from model
    Post *currentPost = ((Post *)_usersFeed.posts[index]);

    //Assign the data from model to the ui elements.
    view = [[NSBundle mainBundle] loadNibNamed:@"PostView" owner:self options:nil][0];
    
    //Set the data for the subview from the model.
    _postText.text = currentPost.content;
    _postImage.image = currentPost.image;
    
    return view;
}

//This is the deallocation method to deallocate the swipe view.
- (void)dealloc
{
    _swipeView.delegate = nil;
    _swipeView.dataSource = nil;
}

//Receive memory warning method, not used at this moment.
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Segue not needed anymore but can be used in the future.
- (IBAction)segueToResponseView:(id)sender
{
    [self performSegueWithIdentifier: @"segueToResponseView" sender: self];
}

/*- (IBAction)segueToNewPostView:(id)sender
{
    [self performSegueWithIdentifier: @"segueToNewPostView" sender: self];
}*/

//Tap gesture for the new post view.
- (IBAction)tapGesture:(id)sender
{
    
    //Create the forceBounce behavior
    forceBounce = [[ForceBounceBehavior alloc] initWithItems:@[theNewPostView] mode:@"skyMode"];
    
    //Create a push behavior with two UIViews and a continuous 'push' mode
    [animator addBehavior:forceBounce];
    
}

//Pan gesture for the new post view.
- (IBAction)panGesture:(UIPanGestureRecognizer*)sender
{
    //Get the state of the gesture and check.
    switch (sender.state){
            
        //When the gesture just began.
        case UIGestureRecognizerStateBegan:{
            
            //Remove all behaviors.
            [animator removeAllBehaviors];
            
            break;
            
        }
        //When the gesture moved.
        case UIGestureRecognizerStateChanged:{
            
            //Get the point of translation.
            CGPoint translation = [sender translationInView:sender.view];
            
            //Update the point for the center of the view.
            sender.view.center = CGPointMake(sender.view.center.x,
                                             sender.view.center.y + translation.y);
            
            //Update the translation.
            [sender setTranslation:CGPointMake(0, 0) inView:sender.view];
            
            //Just log out the x,y coordinates for debugging purposes.
            NSLog(@"y:%f x:%f", sender.view.center.y, sender.view.center.x);
            
            //Get and store the velocity of the y and x axis for the gesture.
            CGFloat xVelocity = [sender velocityInView:sender.view].x;
            CGFloat yVelocity = [sender velocityInView:sender.view].y;
            
            //Set the velocity for the item to the velocity of the gesture.
            [dynamicItem addLinearVelocity:CGPointMake(xVelocity, yVelocity) forItem:sender.view];
            
            //Add the dynamic behavior to the animator.
            [animator addBehavior:dynamicItem];
            
            break;
            
        }
        //When the gesture ended.
        case UIGestureRecognizerStateEnded:{
            
            //Get the velocity of the view.
            CGPoint velocity = [sender velocityInView:self.view];
            
            //If the pan ended while swiping up then apply sky bounce.
            if(velocity.y < 0 ){//|| sender.view.center.y > -280){
                
                //Initialize the bounce with sky as the border.
                [bounce addBorderhWithIdentifer:@"Sky"
                                      fromPoint:CGPointMake(0.0f, -404.0f)
                                        toPoint:CGPointMake(320.0f, -404.0f)];
                
                //Add the bounce to the animator.
                [animator addBehavior:bounce];
                
            }
            //If pan ended while swiping down apply the snap.
            else{
                
                //First remove all other behaviors.
                [animator removeAllBehaviors];
                
                //Create the left and righ boundaries so snap doesn't shake the view.
                [collision addBoundaryWithIdentifier:@"Left"
                                           fromPoint:CGPointMake(26.0f, -100.0f)
                                             toPoint:CGPointMake(26.0f, 800.0f)];
                
                [collision addBoundaryWithIdentifier:@"Right"
                                           fromPoint:CGPointMake(26.0f+268.0f, -100.0f)
                                             toPoint:CGPointMake(26.0f+268.0f, 800.0f)];
                
                //Add all needed behaviors to the animator.
                [animator addBehavior:collision];
                [animator addBehavior:snapComments];
                
            }
            break;
            
        }
            
    }

    
}
@end
