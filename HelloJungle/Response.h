//
//  Response.h
//  HelloJungle
//
//  Created by Albert Toledo on 2/25/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Response : NSObject

//Properties
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) NSString *content;

@end
