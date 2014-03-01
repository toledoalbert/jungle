//
//  NewPostViewController.h
//  HelloJungle
//
//  Created by Albert Toledo on 2/27/14.
//  Copyright (c) 2014 Albert Toledo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewPostViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


//Properties
@property (strong, nonatomic) IBOutlet UIImageView *pickedImage;

- (IBAction)takePicture:(UIButton *)sender;
- (IBAction)selectPicture:(UIButton *)sender;




@end
