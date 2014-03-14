//
//  NewPostView.m
//  HelloJungle
//
//  Created by Albert Toledo on 3/13/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "NewPostView.h"

@implementation NewPostView

@synthesize textView;
@synthesize backgroundImage;
@synthesize buttonPost;
@synthesize bounce;
@synthesize animator;

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
        
        //Initialize the animator
        animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.superview];
        
        //Set button disabled by default.
        buttonPost.enabled = NO;
        
        //Animation
        //Initialize the bounce behavior
        bounce = [[BounceBehavior alloc] initWithItems:@[self]];
        
        //set the gravity for bounce
        [bounce setGravityWithDirection:0.0 andMagnitude:-1.0];
        
    }
    return self;
}

//This method dismisses the keyboard when textview looses focus.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([textView isFirstResponder] && ([touch view] != textView || [touch view
                                                                     ] == self.superview)) {
        [textView resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

//Messages to pick colors/////////////////////////////////////
//Pick orange color.

- (void)pickColorWithColorName:(NSString *)color{
    
    //Remove background from textview.
    [textView setBackgroundColor:nil];
    
    //Add the background image to the background imageview.
    [backgroundImage setImage:[UIImage imageNamed:color]];
    
    //Set the new text color matching the background.
    [textView setTextColor:[UIColor whiteColor]];
    
    //Enable the button.
    buttonPost.enabled = YES;
    
}

//Pick orange.
- (IBAction)pickOrange:(id)sender{
    
    [self pickColorWithColorName:@"Orange.jpg"];
}

//Pick pink.
- (IBAction)pickPink:(id)sender {
    
    [self pickColorWithColorName:@"Pink.jpg"];
    
}

//Pink red.
- (IBAction)pickRed:(id)sender {
    
    [self pickColorWithColorName:@"Red.jpg"];
    
}

//Pick yellow.
- (IBAction)pickYellow:(id)sender {
    
    [self pickColorWithColorName:@"Yellow.jpg"];
    
}

//Pick blue.
- (IBAction)pickBlue:(id)sender {
    
    [self pickColorWithColorName:@"Blue.jpg"];
    
}

- (IBAction)sendPost:(id)sender {
    
    //Send the post object to the server.
    
    //Initialize the bounce with sky as the border.
    [bounce addBorderhWithIdentifer:@"Sky"
                          fromPoint:CGPointMake(0.0f, -404.0f)
                            toPoint:CGPointMake(320.0f, -404.0f)];
    
    //Add the bounce to the animator.
    [animator addBehavior:bounce];
    
    buttonPost.enabled = NO;
    
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
