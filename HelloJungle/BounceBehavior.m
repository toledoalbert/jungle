//
//  Bounce.m
//  HelloJungle
//
//  Created by Albert Toledo on 3/12/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "BounceBehavior.h"

@implementation BounceBehavior

//Attributes - Synthesized Properties
@synthesize gravity;
@synthesize collision;

-(instancetype)initWithItems:(NSArray*)items
{
    if(self = [super init])
    {
        //Initalizing the syntheized behaviors properties
        gravity = [[UIGravityBehavior alloc] initWithItems:items];
        collision = [[UICollisionBehavior alloc] initWithItems:items];
        
        //Adding the subBehaviors to the Force Behavior object
        [self addChildBehavior:gravity];
        [self addChildBehavior:collision];
        
    }//end if condition
    
    //returning an instance of self to the object that called the constructor
    return self;
    
}//end Constructor

//Method - addCollisionBorder
-(void)addBorderhWithIdentifer:(NSString*)identifer
                     fromPoint:(CGPoint)inital toPoint:(CGPoint)destination
{
    //Setting the identifer, fromPoint, and to Point of the collision border
    [collision addBoundaryWithIdentifier:identifer
                               fromPoint:inital
                                 toPoint:destination];
    
}//end setCollisionBehavior Method

//Method - setGravityBehavior
-(void)setGravityWithDirection:(float)direction  andMagnitude:(float)magnitude
{
    //Setting the magnitude and direction for gravity
    [gravity setGravityDirection:CGVectorMake(direction, magnitude)];
    
}//end setGravityBehavior Method



@end
