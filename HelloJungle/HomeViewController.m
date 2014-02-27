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
    
    ////////SAMPLE DATA/////////
    Post *post1 = [[Post alloc] init];
    post1.user =  [[User alloc] init];
    post1.image = [[UIImage alloc] initWithContentsOfFile:@"image1.jpg"];
    post1.content = @"Where is Post1?";
    
    Post *post2 = [[Post alloc] init];
    post2.user =  [[User alloc] init];
    post2.image = [[UIImage alloc] initWithContentsOfFile:@"image2.jpg"];
    post2.content = @"Where is Post2?";
    
    Post *post3 = [[Post alloc] init];
    post3.user =  [[User alloc] init];
    post3.image = [[UIImage alloc] initWithContentsOfFile:@"image3.jpeg"];
    post3.content = @"Where is Post3?";
    
    Post *post4 = [[Post alloc] init];
    post4.user =  [[User alloc] init];
    post4.image = [[UIImage alloc] initWithContentsOfFile:@"image4.jpg"];
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
    _swipeView.itemsPerPage = 2;
    _swipeView.truncateFinalPage = YES;
}

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    //Here we need to return the number of posts
    //that the user has in his/her feed.
    //This number will be returned from the User objects, feed property's
    //posts array
    return 10;//_usersFeed.posts.count; //Number of the posts in the feed retrieved from the attribute.
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    
    //Get the data from model
    //NSString *content = ((Post *)_usersFeed.posts[index]).content;
    //UIImageView *image = [[UIImageView alloc] initWithImage:((Post *)_usersFeed.posts[index]).image];
    
    
    if (!view)
    {
        //Assign the data from model to the ui elements.
    	//view = [[UIView alloc] initWithFrame:self.swipeView.bounds];
        view = [[NSBundle mainBundle] loadNibNamed:@"PostView" owner:self options:nil][0];
    }
    
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

@end
