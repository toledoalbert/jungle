//
//  ResponseViewController.m
//  HelloJungle
//
//  Created by Blake McMillian on 2/26/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "ResponseViewController.h"
#import "BounceyTransition.h"
#import "Math.h"
#import "CustomTableViewCell.h"
#import "CommentsView.h"
#import "CustomTableViewCell.h"

@interface ResponseViewController ()

@end

@implementation ResponseViewController;

@synthesize animator;
@synthesize viewComments;
@synthesize forceBounce;
@synthesize bounce;
@synthesize snapComments;
@synthesize dynamicItem;
@synthesize collision;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
   // tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"customCell";
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.arrItems objectAtIndex:indexPath.row];
    return cell;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.viewComments.customTableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"customCell"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.arrItems = [[NSArray alloc] initWithObjects:@"Item 1",@"Item 2",
                     @"Item 3",@"Item 4",@"Item 5",@"Item 6",@"Item 7", @"Item 8", nil];
    
    [viewComments.customTableView setDelegate:self];
    [viewComments.customTableView setDataSource:self];
  //   [self.view addSubview:viewComments.customTableView
 //     ];
    
    
    //Styling Homescreen button
    _returnToHomeScreen.buttonColor = [UIColor turquoiseColor];
    [_returnToHomeScreen setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    
    _returnToHomeScreen.buttonColor = [UIColor turquoiseColor];
    [_returnToHomeScreen setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    
    //Initialize the animator
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    bounce = [[BounceBehavior alloc] initWithItems:@[viewComments]];
    
    //set the gravity for bounce
    [bounce setGravityWithDirection:0.0 andMagnitude:1.0];
    
    //set the collision border for bounce
    [bounce addBorderhWithIdentifer:@"Ground"
                          fromPoint:CGPointMake(0.0f, 498.0f+471.0f)
                            toPoint:CGPointMake(320.0f, 498.0f+471.0f)];
    
    //Create the custom snap for comments
    snapComments = [[CustomSnapBehavior alloc] initWithItem:viewComments
                                             andSnaptoPoint:CGPointMake(160.0, 292.5)];
    
    [snapComments setDamping:1.2];
    
    //Create collision for snap
    collision = [[UICollisionBehavior alloc] initWithItems:@[viewComments]];
    
    //Create the forceBounce behaviorself.tableView = [[KBSMoreTableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];

    forceBounce = [[ForceBounceBehavior alloc] initWithItems:@[viewComments]];
    
    //Add the gravity properties
    [forceBounce setGravityWithDirection:1.5*M_PI andMagnitude:15.0];
    
    
    
    
    }




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnToHomeView:(id)sender
{
    //Poping a view controller from the navigation controller - (Returning to the homescreen)
    [self performSegueWithIdentifier: @"segueToHomeView" sender: self];
    
    
}


- (IBAction)tapComments:(id)sender {
    
    //Create the forceBounce behavior
    forceBounce = [[ForceBounceBehavior alloc] initWithItems:@[viewComments] mode:@"groundMode"];
    
    //Create a push behavior with two UIViews and a continuous 'push' mode
    [animator addBehavior:forceBounce];
    
}

- (IBAction)panComments:(UIPanGestureRecognizer *)sender
{
    
    
    switch (sender.state)
    {
            
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
            if(velocity.y > 0 || sender.view.center.y > 667.5){
            [bounce addBorderhWithIdentifer:@"Ground"
                                    fromPoint:CGPointMake(0.0f, 498.0f+471.0f)
                                    toPoint:CGPointMake(320.0f, 498.0f+471.0f)];

                
                [animator addBehavior:bounce];
            
            }
            else{
                
                [collision addBoundaryWithIdentifier:@"Left"
                                           fromPoint:CGPointMake(26.0f, 200.0f)
                                             toPoint:CGPointMake(26.0f, 800.0f)];
                
                [collision addBoundaryWithIdentifier:@"Right"
                                           fromPoint:CGPointMake(26.0f+268.0f, 200.0f)
                                             toPoint:CGPointMake(26.0f+268.0f, 800.0f)];
                
                
                [animator addBehavior:collision];
                [animator addBehavior:snapComments];
                
            }
            
            break;
            
        }
            
    }
    
}



/*Method - PrepareForSegue
Performing a segue to pass a reference of the subResponse View controller to
an attribute within the Response View Controlller 
 */
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"containerSegue"])
    {
        
        
    }

}


@end
