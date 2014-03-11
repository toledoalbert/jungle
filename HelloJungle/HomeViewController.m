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

@implementation HomeViewController


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
    post1.image = [[UIImage alloc] initWithContentsOfFile:@"image1.jpg"];
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
@end
