//
//  ForceBounce.m
//  HelloJungle
//
//  Created by Albert Toledo on 3/12/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "ForceBounceBehavior.h"

@implementation ForceBounceBehavior

@synthesize push;
@synthesize gravity;
@synthesize collision;


-(instancetype)initWithItems:(NSArray*)items
{
    if(self = [super init])
    {
        //Initalizing the syntheized behaviors properties
        gravity = [[UIGravityBehavior alloc] initWithItems:items];
        collision = [[UICollisionBehavior alloc] initWithItems:items];
        push = [[UIPushBehavior alloc] initWithItems:items
                                                mode:UIPushBehaviorModeInstantaneous];
          
        //Adding the subBehaviors to the Force Behavior object
        [self addChildBehavior:gravity];
        [self addChildBehavior:push];
        [self addChildBehavior:collision];
        
        
    }//end if condition
    
    return self;
}//end Constructor

//Method - setPushBehavior
-(void)setPushWithAngle:(float)angle  andMagnitude:(float)magnitude
{
    //Setting the angle and magnitude for the pushBehavior
    [push setAngle:angle magnitude:magnitude];
    
}//end setPushBehavior Method











@end
