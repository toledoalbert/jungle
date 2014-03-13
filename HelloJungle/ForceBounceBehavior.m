//
//  ForceBounce.m
//  HelloJungle
//
//  Created by Albert Toledo on 3/12/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "ForceBounceBehavior.h"

@implementation ForceBounceBehavior

//Attributes - Synthesized Properties
@synthesize push;
@synthesize gravity;
@synthesize collision;


-(instancetype)initWithItems:(NSArray*)items mode:(NSString*)mode

{
    if(self = [super init])
    {
        //Initalizing the syntheized behaviors properties
        gravity = [[UIGravityBehavior alloc] initWithItems:items];
        collision = [[UICollisionBehavior alloc] initWithItems:items];
        push = [[UIPushBehavior alloc] initWithItems:items
                                                mode:UIPushBehaviorModeInstantaneous];
        
        
        
        /*Conditional statement that Checks the mode, and initializes it
        accordinglingly. This condidtional sets the ground collision boundary
         or sky collision boundry, and the angle, and velocity for the push
         force, along with the corresponding gravity direction.*/
        if([mode isEqualToString:@"groundMode"])
        {
            //setting the properties for the gravity behavior
            [gravity setGravityDirection:CGVectorMake(0.0, 1.0)];
            
            //Setting the properties for the force push behavior
            [push setAngle:1.5*M_PI magnitude:15.0];
            
            //Setting the properties for the collision behavior
            [collision addBoundaryWithIdentifier:@"Ground"
                                       fromPoint:CGPointMake(0.0f, 498.0f+471.0f)
                                         toPoint:CGPointMake(320.0f, 498.0f+471.0f)];
            
        }//end if condition
        else if([mode isEqualToString:@"skyMode"])
        {
            //setting the properties for the gravity behavior
            [gravity setGravityDirection:CGVectorMake(0.0, -1.0)];
            
            //Setting the properties for the force push behavior
            [push setAngle:-1.5*M_PI magnitude:15.0];
            
            //Setting the properties for the collision behavior
            [collision addBoundaryWithIdentifier:@"Sky"
                                       fromPoint:CGPointMake(0.0f, -404.0f)
                                         toPoint:CGPointMake(320.0f, -404.0f)];
        }//end else if condiditional
        
        //Adding the subBehaviors to the Force Behavior object
        [self addChildBehavior:gravity];
        [self addChildBehavior:push];
        [self addChildBehavior:collision];
        
        
    }//end if condition
    
    //returning an instance of self, to the instance that called the initializing constructor
    
    return self;
    
}//end Constructor












@end
