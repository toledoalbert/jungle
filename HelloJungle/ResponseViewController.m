//
//  ResponseViewController.m
//  HelloJungle
//
//  Created by Blake McMillian on 2/26/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "ResponseViewController.h"

@interface ResponseViewController ()

@end

@implementation ResponseViewController

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
    
    //Styling Homescreen button
    _buttonReturnToHomeView.buttonColor = [UIColor turquoiseColor];
    [_buttonReturnToHomeView setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    
    _buttonReturnToHomeView.buttonColor = [UIColor turquoiseColor];
    [_buttonReturnToHomeView setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
