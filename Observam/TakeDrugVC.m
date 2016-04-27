//
//  TakeDrugVC.m
//  Observam
//
//  Created by Mathieu Godart on 16/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

#import "TakeDrugVC.h"
#import "AppDelegate.h"

@interface TakeDrugVC ()
@property (strong, nonatomic) IBOutlet UIButton *takeDrugBtn;
@property (strong, nonatomic) IBOutlet UIImageView *drugImgV;
@end



@implementation TakeDrugVC



- (void)viewDidAppear:(BOOL)animated {
    [self performSegueWithIdentifier:@"showDrugLeftScreen" sender:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];

    if (AppD.me.drugAlreadyTaken) {
        self.drugImgV.alpha = 1;
        [self.takeDrugBtn setTitle:@"Traitement déjà pris. Bravo !"
                          forState:UIControlStateNormal];
        self.takeDrugBtn.userInteractionEnabled = NO;
    }
    else {
        self.drugImgV.alpha = self.defaultDrugImgAlpha;
    }
}

- (CGFloat)defaultDrugImgAlpha { return 0.06; }



- (IBAction)takeDrugBtnDown:(UIButton *)sender {
    NSLog(@"Drug taking: start");

    [UIView animateWithDuration:0.8 delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^
     {
         self.drugImgV.alpha = 1;
     }
                     completion:^(BOOL finished)
     {
         if (finished) {
             NSLog(@"Drug taking: done");

             [self didTakeDrug];

             [self.takeDrugBtn setTitle:@"Traitement pris. Bravo !"
                               forState:UIControlStateNormal];
             self.takeDrugBtn.userInteractionEnabled = NO;

             [UIView animateWithDuration:0.12 animations:^
              {
                  self.drugImgV.transform = CGAffineTransformMakeScale(1.14, 1.14);
              }
                              completion:^(BOOL finished)
              {
                  self.drugImgV.transform = CGAffineTransformIdentity;
              }];
         }
         else {
             NSLog(@"Drug taking: cancel done");

             [UIView animateWithDuration:0.5 animations:^
              {
                  self.drugImgV.alpha = self.defaultDrugImgAlpha;
              }];
         }
    }];
}



- (IBAction)takeDrugBtnUp:(id)sender {
    NSLog(@"Drug taking: btn released");
    [self.drugImgV.layer removeAllAnimations];
}



- (void)didTakeDrug {
    AppD.me.drugAlreadyTaken = YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
