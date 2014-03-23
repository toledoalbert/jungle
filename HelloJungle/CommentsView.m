//
//  CommentsView.m
//  HelloJungle
//
//  Created by Albert Toledo on 3/13/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "CommentsView.h"
#import "CustomTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation CommentsView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self addSubview:[[[NSBundle mainBundle] loadNibNamed:@"CommentsView" owner:self options:nil] objectAtIndex:0]];
        
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(5.0f,5.0f);
        self.layer.shadowOpacity = 1.0f;
        self.layer.shadowRadius = 5.0f;
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
