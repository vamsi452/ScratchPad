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
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Successful" message:@"Your Sketch has been saved to photos" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
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
