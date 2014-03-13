//
//  ForceBounce.h
//  HelloJungle
//
//  Created by Albert Toledo on 3/12/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BounceBehavior.h"

@interface ForceBounceBehavior : BounceBehavior

//Attributes - Behaviors
@property(strong, nonatomic) UIPushBehavior *push;
@property(strong, nonatomic) UIGravityBehavior *gravity;
@property(strong, nonatomic) UICollisionBehavior *collision;
@property(strong, nonatomic) UIDynamicItemBehavior *forceBounceItemBehviors;

//Attributes - Constructor

//Initializes the Dynamic Behavior properties
-(instancetype)initWithItems:(NSArray*)items mode:(NSString*)mode;

@end
