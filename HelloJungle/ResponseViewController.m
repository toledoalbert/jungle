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
    //Hiding the Background "back" button
    self.navigationItem.leftBarButtonItem=nil;
    self.navigationItem.hidesBackButton=YES;
    
    //Hiding the Navigation control bar.
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    //Displaying the contents in the Comment's subViewController
    _commentSubViewController.backgroundColor = [UIColor grayColor];
    
    //Styling Homescreen button
    _returnToHomeScreen.buttonColor = [UIColor turquoiseColor];
    [_returnToHomeScreen setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    
    _returnToHomeScreen.buttonColor = [UIColor turquoiseColor];
    [_returnToHomeScreen setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnToHomeView:(id)sender
{
    //Poping a view controller from the navigation controller - (Returning to the homescreen)
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
@end
