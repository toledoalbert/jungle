//
//  Bounce.h
//  HelloJungle
//
//  Created by Albert Toledo on 3/12/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BounceBehavior : UIDynamicBehavior

//Attributes - Behaviors
@property(strong, nonatomic) UIGravityBehavior *gravity;
@property(strong, nonatomic) UICollisionBehavior *collision;
@property(strong, nonatomic) UIDynamicItemBehavior *forceBounceItemBehviors;


//Attributes - Constructor
-(instancetype)initWithItems:(NSArray*)items;

//Attributes - Methods
-(void)addBorderhWithIdentifer:(NSString*)identifer
                     fromPoint:(CGPoint)inital toPoint:(CGPoint)destination;
-(void)setGravityWithDirection:(float)direction  andMagnitude:(float)magnitude;

@end
