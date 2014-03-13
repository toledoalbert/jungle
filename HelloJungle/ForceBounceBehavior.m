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


-(instancetype)initWithItems:(NSArray*)items mode:(NSString*)mode

{
    if(self = [super init])
    {
        //Initalizing the syntheized behaviors properties
        gravity = [[UIGravityBehavior alloc] initWithItems:items];
        collision = [[UICollisionBehavior alloc] initWithItems:items];
        push = [[UIPushBehavior alloc] initWithItems:items
                                                mode:UIPushBehaviorModeInstantaneous];
        
        
        
        //Check the mode
        if([mode isEqualToString:@"groundMode"]){
            [gravity setGravityDirection:CGVectorMake(0.0, 1.0)];
            
            //Setting the properties for the force push behavior
            [push setAngle:1.5*M_PI magnitude:15.0];
            
            [collision addBoundaryWithIdentifier:@"Ground"
                                       fromPoint:CGPointMake(0.0f, 498.0f+471.0f)
                                         toPoint:CGPointMake(320.0f, 498.0f+471.0f)];
            
        }//more modes can be added in the future
        else if([mode isEqualToString:@"skyMode"]){
            [gravity setGravityDirection:CGVectorMake(0.0, -1.0)];
            
            //Setting the properties for the force push behavior
            [push setAngle:-1.5*M_PI magnitude:15.0];
            
            [collision addBoundaryWithIdentifier:@"Sky"
                                       fromPoint:CGPointMake(0.0f, -404.0f)
                                         toPoint:CGPointMake(320.0f, -404.0f)];
        }
        
        
        
        
        
        
        //Adding the subBehaviors to the Force Behavior object
        [self addChildBehavior:gravity];
        [self addChildBehavior:push];
        [self addChildBehavior:collision];
        
        
    }//end if condition
    
    return self;
}//end Constructor












@end
