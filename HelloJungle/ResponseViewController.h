//
//  ResponseViewController.h
//  HelloJungle
//
//  Created by Blake McMillian on 2/26/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlatUIKit.h"

@interface ResponseViewController : UIViewController

//Attributes - Buttons
@property (weak, nonatomic) IBOutlet FUIButton *returnToHomeScreen;

//Attributes - Labels
@property (weak, nonatomic) IBOutlet UILabel *CommentLabel; // not used

//Attributes - View Controllers
@property (weak, nonatomic) IBOutlet UIView *commentSubViewController;

//Attributes - Actions
- (IBAction)returnToHomeView:(id)sender;

@end
