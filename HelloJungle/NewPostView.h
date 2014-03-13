//
//  NewPostView.h
//  HelloJungle
//
//  Created by Albert Toledo on 3/13/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewPostView : UIView

//UI Elements for the new post view
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIButton *buttonPost;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;


//Methods
- (id)initWithCoder:(NSCoder *)aDecoder;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

//Actions
- (IBAction)pickOrange:(id)sender;
- (IBAction)pickPink:(id)sender;
- (IBAction)pickRed:(id)sender;
- (IBAction)pickYellow:(id)sender;
- (IBAction)pickBlue:(id)sender;
- (IBAction)sendPost:(id)sender;


@end
