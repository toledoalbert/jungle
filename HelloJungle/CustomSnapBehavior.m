//
//  CustomSnap.m
//  HelloJungle
//
//  Created by Albert Toledo on 3/12/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "CustomSnapBehavior.h"

@implementation CustomSnapBehavior

@synthesize snap;

-(instancetype)initWithItem:(id <UIDynamicItem>)item andSnaptoPoint:(CGPoint)point
{
    if(self = [super init])
    {
        //Initalizing the syntheized behaviors properties
        snap = [[UISnapBehavior alloc] initWithItem:item snapToPoint:point];
        
        //Adding the subBehaviors to the CustomSnap Behaviors object
        [self addChildBehavior:snap];
        
    }//end if condition
    
    return self;
}//end Constructor


//Method
-(void)setDamping:(float) damping
{
    snap.damping = damping;

}//end damping method

@end
