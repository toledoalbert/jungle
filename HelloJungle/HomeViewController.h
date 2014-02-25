//
//  HomeViewController.h
//  HelloJungle
//
//  Created by Albert Toledo on 2/25/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *buttonNewPost;
@property (strong, nonatomic) IBOutlet UIButton *buttonAnswerComment;

- (IBAction)answerComment:(id)sender;
- (IBAction)newPost:(id)sender;


@end
