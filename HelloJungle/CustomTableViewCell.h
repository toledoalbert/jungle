//
//  CustomTableViewCell.h
//  HelloJungle
//
//  Created by Blake McMillian on 3/14/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

//Attributes - Views
@property (strong, nonatomic) IBOutlet UIView *tableViewCell;

//Attributes - Labels
@property (strong, nonatomic) IBOutlet UILabel *leftCellLabel;


@end
