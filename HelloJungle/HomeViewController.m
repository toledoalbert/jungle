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
//@synthesize animatorNewPost;
//@synthesize animatorMain;
@synthesize forceBounceNewPost;
@synthesize bounceNewPost;
@synthesize snapNewPost;
@synthesize dynamicItemNewPost;
@synthesize collisionNewPost;

@synthesize forceBounceComments;
@synthesize bounceComments;
@synthesize snapComments;
@synthesize dynamicItemComments;
@synthesize collisionComments;

//Response View Attributes
@synthesize viewComments;
@synthesize shadowView;

//Init with nib name method, not used at the moment
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

//View did load, this is where shit happens.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    //This was a test object. Tested successfully with Parse.
    /*PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];*/
    
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
    
    
    //configure swipe view
    _swipeView.alignment = SwipeViewAlignmentCenter;
    _swipeView.pagingEnabled = NO;
    //_swipeView.wrapEnabled = YES;
    _swipeView.itemsPerPage = 1;
    
    //Initialize the animator
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.viewComments];
    //self.animatorNewPost = [[UIDynamicAnimator alloc] initWithReferenceView:self.theNewPostView];
    //self.animatorMain = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    //Initialize the bounce behavior
    bounceNewPost = [[BounceBehavior alloc] initWithItems:@[theNewPostView]];
    
    //set the gravity for bounce
    [bounceNewPost setGravityWithDirection:0.0 andMagnitude:-1.0];
    
    //set the collision border for bounce
    [bounceNewPost addBorderhWithIdentifer:@"Ground"
                          fromPoint:CGPointMake(0.0f, 498.0f+471.0f)
                            toPoint:CGPointMake(320.0f, 498.0f+471.0f)];
    
    //Initialize the custom snap for comments
    snapNewPost = [[CustomSnapBehavior alloc] initWithItem:theNewPostView
                                             andSnaptoPoint:CGPointMake(160.0, 292.5)];
    
    //Set the damping for the snap
    [snapNewPost setDamping:1.2];
    
    //Create collision for snap
    collisionNewPost = [[UICollisionBehavior alloc] initWithItems:@[theNewPostView]];
    
    //Create the forceBounce behavior
    forceBounceNewPost = [[ForceBounceBehavior alloc] initWithItems:@[theNewPostView]];
    
    //Add the gravity properties
    [forceBounceNewPost setGravityWithDirection:-1.5*M_PI andMagnitude:15.0];
    
    
    //////////////////////////////////////////////////////////////////////
    //////////////////////////Resoonse View////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////
    
    self.commentItems = [[NSArray alloc] initWithObjects:nil];
    
    [viewComments.customTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [viewComments.customTableView setDelegate:self];
    [viewComments.customTableView setDataSource:self];
    [viewComments.textFieldInput setDelegate:self];
    
    bounceNewPost = [[BounceBehavior alloc] initWithItems:@[viewComments]];
    
    //set the gravity for bounce
    [bounceComments setGravityWithDirection:0.0 andMagnitude:15.0];
    
    //set the collision border for bounce
    [bounceComments addBorderhWithIdentifer:@"Ground"
                          fromPoint:CGPointMake(0.0f, 498.0f+471.0f)
                            toPoint:CGPointMake(320.0f, 498.0f+471.0f)];
    
    //Create the custom snap for comments
    snapComments = [[CustomSnapBehavior alloc] initWithItem:viewComments
                                             andSnaptoPoint:CGPointMake(160.0, 292.5)];
    
    [snapComments setDamping:1.2];
    
    //Create collision for snap
    collisionComments = [[UICollisionBehavior alloc] initWithItems:@[viewComments]];
    
    //Create the forceBounce behaviorself.tableView = [[KBSMoreTableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
    
    forceBounceComments = [[ForceBounceBehavior alloc] initWithItems:@[viewComments]];
    
    //Add the gravity properties
    [forceBounceComments setGravityWithDirection:1.5*M_PI andMagnitude:15.0];
    
    self.shadowView = [[UIView alloc]initWithFrame:self.view.frame];
    self.shadowView.backgroundColor = [UIColor blackColor];
    self.shadowView.autoresizesSubviews = NO;
    [self.view addSubview:self.shadowView];
    
    self.shadowView.alpha = 0.0;
    self.shadowView.hidden = YES;
    currentPosition = 0.0;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //Returning one section in the table view
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    //returning 8 items in the row, in the tableview
    return self.commentItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"customCell";
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    cell.mainTextLabel.text = [self.commentItems objectAtIndex:indexPath.row];
    
    
    return cell;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.viewComments.customTableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil]
                            forCellReuseIdentifier:@"customCell"];
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *input = textField.text;
    
    [self appendElementsToArray:input];
    
    textField.text = @"";
    
    [self animateTextField: textField up: NO];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 190; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

-(void)appendElementsToArray:(NSString *)inputString
{
    NSArray* tempArray = [[NSArray alloc] initWithObjects:inputString, nil];
    
    NSArray *tempArray2 = [self.commentItems arrayByAddingObjectsFromArray:tempArray];
    
    self.commentItems = tempArray2;
    [viewComments.customTableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    
}//end method







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

//This is called when the swipeview stops decelerating.
- (void)swipeViewDidEndDecelerating:(SwipeView *)swipeView{
    
    _swipeView.pagingEnabled = YES;
    
}

//This is called when user starts dragging the swipeview.
- (void)swipeViewWillBeginDragging:(SwipeView *)swipeView{
    
    _swipeView.pagingEnabled = NO;
    
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
    forceBounceNewPost = [[ForceBounceBehavior alloc] initWithItems:@[theNewPostView] mode:@"skyMode"];
    
    //Create a push behavior with two UIViews and a continuous 'push' mode
    [animator addBehavior:forceBounceNewPost];
    
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
            [dynamicItemNewPost addLinearVelocity:CGPointMake(xVelocity, yVelocity) forItem:sender.view];
            
            //Add the dynamic behavior to the animator.
            [animator addBehavior:dynamicItemNewPost];
            
            break;
            
        }
        //When the gesture ended.
        case UIGestureRecognizerStateEnded:{
            
            //Get the velocity of the view.
            CGPoint velocity = [sender velocityInView:self.view];
            
            //If the pan ended while swiping up then apply sky bounce.
            if(velocity.y < 0 ){//|| sender.view.center.y > -280){
                
                //Initialize the bounce with sky as the border.
                [bounceNewPost addBorderhWithIdentifer:@"Sky"
                                      fromPoint:CGPointMake(0.0f, -404.0f)
                                        toPoint:CGPointMake(320.0f, -404.0f)];
                
                //Add the bounce to the animator.
                [animator addBehavior:bounceNewPost];
                
            }
            //If pan ended while swiping down apply the snap.
            else{
                
                //First remove all other behaviors.
                [animator removeAllBehaviors];
                
                //Create the left and righ boundaries so snap doesn't shake the view.
                [collisionNewPost addBoundaryWithIdentifier:@"Left"
                                           fromPoint:CGPointMake(26.0f, -100.0f)
                                             toPoint:CGPointMake(26.0f, 800.0f)];
                
                [collisionNewPost addBoundaryWithIdentifier:@"Right"
                                           fromPoint:CGPointMake(26.0f+268.0f, -100.0f)
                                             toPoint:CGPointMake(26.0f+268.0f, 800.0f)];
                
                //Add all needed behaviors to the animator.
                [animator addBehavior:collisionNewPost];
                [animator addBehavior:snapNewPost];
                
            }
            break;
            
        }
            
    }

    
}

- (IBAction)commentTapGesture:(UITapGestureRecognizer *)sender
{
    
    //Create the forceBounce behavior
    forceBounceComments = [[ForceBounceBehavior alloc] initWithItems:@[viewComments] mode:@"groundMode"];
    
    //Create a push behavior with two UIViews and a continuous 'push' mode
    [animator addBehavior:forceBounceComments];
    

    
}

- (IBAction)commentPanGesture:(UIPanGestureRecognizer *)sender
{
    switch (sender.state)
    {
            
        case UIGestureRecognizerStateBegan:{
            
            [animator removeAllBehaviors];
            break;
            
        }
        case UIGestureRecognizerStateChanged:
        {
            [self.view insertSubview:self.shadowView belowSubview:viewComments];
             self.shadowView.hidden = NO;
            
            
            CGPoint velocity = [sender velocityInView:self.view];
            
            CGPoint translation = [sender translationInView:sender.view];
            sender.view.center = CGPointMake(sender.view.center.x,
                                             sender.view.center.y + translation.y);
            
            
            [sender setTranslation:CGPointMake(0, 0) inView:sender.view];
            
            NSLog(@"y:%f x:%f", sender.view.center.y, sender.view.center.x);
            
            
            CGFloat currentFrame = sender.view.frame.origin.y;
            
            if(velocity.y < 0)
                currentPosition = 1 - (currentFrame/(365));
            if(currentPosition > 0.6)
                currentPosition = 0.6;
            
            if(velocity.y > 0)
                currentPosition = 1 - (currentFrame/(365));
            if(currentPosition < 0.0)
                currentPosition = 0.0;
            
            if(currentPosition > 0.6)
                currentPosition = 0.6;
            self.shadowView.alpha = currentPosition;
            
            
            CGFloat xVelocity = [sender velocityInView:sender.view].x;
            CGFloat yVelocity = [sender velocityInView:sender.view].y;
            
            [dynamicItemComments addLinearVelocity:CGPointMake(xVelocity, yVelocity) forItem:sender.view];
            
            [animator addBehavior:dynamicItemComments];
            
            
            break;
            
        }
        case UIGestureRecognizerStateEnded:{
            
            
            
            CGPoint velocity = [sender velocityInView:self.view];
            
            if(velocity.y > 0 || sender.view.center.y > 667.5)
            {
                
                
                self.shadowView.alpha = 0.0;
                
                [bounceComments addBorderhWithIdentifer:@"Ground"
                                      fromPoint:CGPointMake(0.0f, 498.0f+471.0f)
                                        toPoint:CGPointMake(320.0f, 498.0f+471.0f)];
                
                
                [animator addBehavior:bounceComments];
                
            }
            else{
                
                [collisionComments addBoundaryWithIdentifier:@"Left"
                                           fromPoint:CGPointMake(26.0f, 200.0f)
                                             toPoint:CGPointMake(26.0f, 800.0f)];
                
                [collisionComments addBoundaryWithIdentifier:@"Right"
                                           fromPoint:CGPointMake(26.0f+268.0f, 200.0f)
                                             toPoint:CGPointMake(26.0f+268.0f, 800.0f)];
                
                
                [animator addBehavior:collisionComments];
                [animator addBehavior:snapComments];
                self.shadowView.alpha = 0.6;
                
            }
            
            break;
            
        }
            
    }

    
}
@end
