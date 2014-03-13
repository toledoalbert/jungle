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

@synthesize theNewPostView;
@synthesize animator;
@synthesize forceBounce;
@synthesize bounce;
@synthesize snapComments;
@synthesize dynamicItem;
@synthesize collision;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
    }
    return self;
}

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
    post1.image = [[UIImage alloc] initWithContentsOfFile:@"image12.jpg"];
    post1.content = @"Where is Post1?";
    
    Post *post2 = [[Post alloc] init];
    post2.user =  [[User alloc] init];
    post2.image = [[UIImage alloc] initWithContentsOfFile:@"/Users/BMaC/Documents/jungle/HelloJungle/image2.jpg"];
    post2.content = @"Where is Post2?";
    
    Post *post3 = [[Post alloc] init];
    post3.user =  [[User alloc] init];
    post3.image = [[UIImage alloc] initWithContentsOfFile:@"/Users/BMaC/Documents/jungle/HelloJungle/image3.jpg"];
    post3.content = @"Where is Post3?";
    
    Post *post4 = [[Post alloc] init];
    post4.user =  [[User alloc] init];
    post4.image = [[UIImage alloc] initWithContentsOfFile:@"/Users/BMaC/Documents/jungle/HelloJungle/image4.jpg"];
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
    
    bounce = [[BounceBehavior alloc] initWithItems:@[theNewPostView]];
    
    //set the gravity for bounce
    [bounce setGravityWithDirection:0.0 andMagnitude:-1.0];
    
    //set the collision border for bounce
    [bounce addBorderhWithIdentifer:@"Ground"
                          fromPoint:CGPointMake(0.0f, 498.0f+471.0f)
                            toPoint:CGPointMake(320.0f, 498.0f+471.0f)];
    
    //Create the custom snap for comments
    snapComments = [[CustomSnapBehavior alloc] initWithItem:theNewPostView
                                             andSnaptoPoint:CGPointMake(160.0, 292.5)];
    
    [snapComments setDamping:1.2];
    
    //Create collision for snap
    collision = [[UICollisionBehavior alloc] initWithItems:@[theNewPostView]];
    
    //Create the forceBounce behavior
    forceBounce = [[ForceBounceBehavior alloc] initWithItems:@[theNewPostView]];
    
    //Add the gravity properties
    [forceBounce setGravityWithDirection:-1.5*M_PI andMagnitude:15.0];
    
    
}

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    //Return the number of posts from the posts array's size of the feed.
    return _usersFeed.posts.count; //Number of the posts in the feed retrieved from the attribute.
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    
    //Get the data from model
    Post *currentPost = ((Post *)_usersFeed.posts[index]);

    //Assign the data from model to the ui elements.
    view = [[NSBundle mainBundle] loadNibNamed:@"PostView" owner:self options:nil][0];
        
    _labelQuestion.text = currentPost.content;
    _postImage.image = currentPost.image;
    
    return view;
}

- (void)dealloc
{
    _swipeView.delegate = nil;
    _swipeView.dataSource = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)segueToResponseView:(id)sender
{
    [self performSegueWithIdentifier: @"segueToResponseView" sender: self];
}

- (IBAction)segueToNewPostView:(id)sender
{
    [self performSegueWithIdentifier: @"segueToNewPostView" sender: self];
}
- (IBAction)tapGesture:(id)sender
{
    
    //Create the forceBounce behavior
    forceBounce = [[ForceBounceBehavior alloc] initWithItems:@[theNewPostView] mode:@"skyMode"];
    
    //Create a push behavior with two UIViews and a continuous 'push' mode
    [animator addBehavior:forceBounce];
    
}

- (IBAction)panGesture:(UIPanGestureRecognizer*)sender
{
    switch (sender.state){
            
        case UIGestureRecognizerStateBegan:{
            
            [animator removeAllBehaviors];
            break;
            
        }
        case UIGestureRecognizerStateChanged:{
            
            CGPoint translation = [sender translationInView:sender.view];
            sender.view.center = CGPointMake(sender.view.center.x,
                                             sender.view.center.y + translation.y);
            
            
            [sender setTranslation:CGPointMake(0, 0) inView:sender.view];
            
            NSLog(@"y:%f x:%f", sender.view.center.y, sender.view.center.x);
            
            
            CGFloat xVelocity = [sender velocityInView:sender.view].x;
            CGFloat yVelocity = [sender velocityInView:sender.view].y;
            
            [dynamicItem addLinearVelocity:CGPointMake(xVelocity, yVelocity) forItem:sender.view];
            
            [animator addBehavior:dynamicItem];
            
            
            break;
            
        }
        case UIGestureRecognizerStateEnded:{
            
            CGPoint velocity = [sender velocityInView:self.view];
            
            //if(sender.view.center.y > 567.5){
            if(velocity.y < 0 ){//|| sender.view.center.y > -280){
                [bounce addBorderhWithIdentifer:@"Sky"
                                      fromPoint:CGPointMake(0.0f, -404.0f)
                                        toPoint:CGPointMake(320.0f, -404.0f)];
                
                [animator addBehavior:bounce];
                
            }
            else{
                
                [animator removeAllBehaviors];
                
                [collision addBoundaryWithIdentifier:@"Left"
                                           fromPoint:CGPointMake(26.0f, -100.0f)
                                             toPoint:CGPointMake(26.0f, 800.0f)];
                
                [collision addBoundaryWithIdentifier:@"Right"
                                           fromPoint:CGPointMake(26.0f+268.0f, -100.0f)
                                             toPoint:CGPointMake(26.0f+268.0f, 800.0f)];
                
                
                [animator addBehavior:collision];
                [animator addBehavior:snapComments];
                
            }
            
            break;
            
        }
            
    }

    
}
@end
