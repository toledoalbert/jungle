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

//This method dismisses the keyboard when textview looses focus.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([textView isFirstResponder] && [touch view] != textView) {
        [textView resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

//Messages to pick colors/////////////////////////////////////
//Pick orange color.
- (IBAction)pickOrange:(id)sender{
    
    //Remove background from textview.
    [textView setBackgroundColor:nil];
    
    //Add the background image to the background imageview.
    [backgroundImage setImage:[UIImage imageNamed:@"Orange.jpg"]];
    
    //Set the new text color matching the background.
    [textView setTextColor:[UIColor whiteColor]];
    
}

- (IBAction)pickPink:(id)sender {
    
    //Remove background from textview.
    [textView setBackgroundColor:nil];
    
    //Add the background image to the background imageview.
    [backgroundImage setImage:[UIImage imageNamed:@"Pink.jpg"]];
    
    //Set the new text color matching the background.
    [textView setTextColor:[UIColor whiteColor]];
    
}

- (IBAction)pickRed:(id)sender {
    
    //Remove background from textview.
    [textView setBackgroundColor:nil];
    
    //Add the background image to the background imageview.
    [backgroundImage setImage:[UIImage imageNamed:@"Red.jpg"]];
    
    //Set the new text color matching the background.
    [textView setTextColor:[UIColor whiteColor]];
    
}

- (IBAction)pickYellow:(id)sender {
    
    //Remove background from textview.
    [textView setBackgroundColor:nil];
    
    //Add the background image to the background imageview.
    [backgroundImage setImage:[UIImage imageNamed:@"Yellow.jpg"]];
    
    //Set the new text color matching the background.
    [textView setTextColor:[UIColor whiteColor]];
    
}

- (IBAction)pickBlue:(id)sender {
    
    //Remove background from textview.
    [textView setBackgroundColor:nil];
    
    //Add the background image to the background imageview.
    [backgroundImage setImage:[UIImage imageNamed:@"Blue.jpg"]];
    
    //Set the new text color matching the background.
    [textView setTextColor:[UIColor whiteColor]];
    
}

- (IBAction)sendPost:(id)sender {
    
    //Send the post object to the server.
    
    //Swipe the new post view back up.
    
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
