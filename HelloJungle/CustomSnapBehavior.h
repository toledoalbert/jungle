//
//  CustomSnap.h
//  HelloJungle
//
//  Created by Albert Toledo on 3/12/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSnapBehavior : UIDynamicBehavior

//variables
@property(strong, nonatomic) UISnapBehavior *snap;
@property(strong, nonatomic) UIDynamicItemBehavior *forceBounceItemBehviors;

//Constructor
-(instancetype)initWithItem:(id <UIDynamicItem>)item andSnaptoPoint:(CGPoint)point;

//Messages
-(void)setDamping:(float) damping;

@end
