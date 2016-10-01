//
//  ScratchPadViewController.m
//  ScratchPad
//
//  Created by Vamsi Kallepalli on 10/1/16.
//  Copyright © 2016 Vamsi Kallepalli. All rights reserved.
//

#import "ScratchPadViewController.h"

@interface ScratchPadViewController ()

@end

@implementation ScratchPadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* Action taken when the "Save" button (saveAsImageButton) is pressed in the app */
- (IBAction)saveScreenshot {
    
    // Define the dimensions of the screenshot you want to take (the entire screen in this case)
    CGSize size =  [[UIScreen mainScreen] bounds].size;
    
    // Create the screenshot
    UIGraphicsBeginImageContext(size);
    // Put everything in the current view into the screenshot
    [[self.view layer] renderInContext:UIGraphicsGetCurrentContext()];
    // Save the current image context info into a UIImage
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Save the screenshot to the device's photo album
    UIImageWriteToSavedPhotosAlbum(newImage, self,
                                   @selector(image:didFinishSavingWithError:contextInfo:), nil);
}


// callback for UIImageWriteToSavedPhotosAlbum
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    if (error) {
        
        NSLog(@"Could not save to photos");
        // Handle if the image could not be saved to the photo album
    }
    else {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Saved" message:@"Your Scratchpad is saved to photos." preferredStyle:UIAlertControllerStyleAlert]; // 7
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            NSLog(@"You pressed button OK");
        }]; // 8
        
        [alert addAction:defaultAction]; // 9
        
        [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = @"Input data...";
        }]; // 10
        /*
        [self presentViewController:alert animated:YES completion:nil];
        
        NSString *title = @"Saved";
        NSString *msg = @"Your Scratchpad is saved to photos";
            UIAlertController *alertController = [self showAlertWithTitle:title Message: msg];
            [self presentViewController:alertController animated:YES completion:nil];
        NSLog(@"Saved to photos");
         */
        // The save was successful and all is well
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
