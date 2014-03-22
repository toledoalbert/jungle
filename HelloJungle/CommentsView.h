//
//  CommentsView.h
//  HelloJungle
//
//  Created by Albert Toledo on 3/13/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsView : UIView
{
    //Attributes - Array
    NSArray *items;
}

- (id)initWithCoder:(NSCoder *)aDecoder;

@property (strong, nonatomic) IBOutlet UITableView *customTableView;
@property (nonatomic,strong) NSArray *arrItems;
@property (strong, nonatomic) IBOutlet UITextField *inputTextField;
@property (strong, nonatomic) IBOutlet UIButton *submitTextButton;




@end
