//
//  Bounce.h
//  HelloJungle
//
//  Created by Albert Toledo on 3/12/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BounceBehavior : UIDynamicBehavior

//variables
@property(strong, nonatomic) UIGravityBehavior *gravity;
@property(strong, nonatomic) UICollisionBehavior *collision;
@property(strong, nonatomic) UIDynamicItemBehavior *forceBounceItemBehviors;


//Methods
-(instancetype)initWithItems:(NSArray*)items;
-(void)addBorderhWithIdentifer:(NSString*)identifer
                     fromPoint:(CGPoint)inital toPoint:(CGPoint)destination;
-(void)setGravityWithDirection:(float)direction  andMagnitude:(float)magnitude;

@end
