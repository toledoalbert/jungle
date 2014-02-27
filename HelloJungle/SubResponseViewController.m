//
//  SubResponseViewController.m
//  HelloJungle
//
//  Created by Blake McMillian on 2/27/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "SubResponseViewController.h"

@interface SubResponseViewController ()

@end

@implementation SubResponseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //Changing the background color within the view controller
    self.view.backgroundColor = [UIColor blueColor];
     
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
