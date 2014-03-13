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


//Methods
- (id)initWithCoder:(NSCoder *)aDecoder;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
