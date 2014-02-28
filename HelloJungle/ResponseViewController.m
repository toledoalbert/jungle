//
//  ResponseViewController.m
//  HelloJungle
//
//  Created by Blake McMillian on 2/26/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import "ResponseViewController.h"
#import "SubResponseViewController.h"

@interface ResponseViewController ()

@end

@implementation ResponseViewController;


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
    [self performSegueWithIdentifier: @"segueToHomeView" sender: self];
    
    
}
//method that animates the view controller
- (IBAction)animateViewController:(id)sender
{
    self.subResponseViewController.view.backgroundColor = [UIColor blueColor];

}


/*Method - PrepareForSegue
Performing a segue to pass a reference of the subResponse View controller to
an attribute within the Response View Controlller 
 */
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"containerSegue"])
    {
        self.subResponseViewController = segue.destinationViewController;
        
    }

}
@end
