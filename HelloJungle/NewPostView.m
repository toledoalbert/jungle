//
//  NewPostView.m
//  HelloJungle
//
//  Created by Albert Toledo on 3/13/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "NewPostView.h"

@implementation NewPostView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self addSubview:[[[NSBundle mainBundle] loadNibNamed:@"NewPostView" owner:self options:nil] objectAtIndex:0]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
