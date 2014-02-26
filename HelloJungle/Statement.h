//
//  Statement.h
//  HelloJungle
//
//  Created by Albert Toledo on 2/25/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "Post.h"
#import "Comment.h"

@interface Statement : Post

//Properties
@property (strong, nonatomic) NSArray *comments; //type Comment

@end
