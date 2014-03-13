//
//  CustomSnap.h
//  HelloJungle
//
//  Created by Albert Toledo on 3/12/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSnapBehavior : UIDynamicBehavior

//Attributes - Behaviors
@property(strong, nonatomic) UISnapBehavior *snap;
@property(strong, nonatomic) UIDynamicItemBehavior *forceBounceItemBehviors;

//Attributes - Constructor
-(instancetype)initWithItem:(id <UIDynamicItem>)item andSnaptoPoint:(CGPoint)point;

//Attributes - Methods
-(void)setDamping:(float) damping;

@end
