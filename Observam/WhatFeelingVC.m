//
//  WhatFeelingVC.m
//  Observam
//
//  Created by Mathieu Godart on 18/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

#import "WhatFeelingVC.h"

@interface WhatFeelingVC_OLD ()

@end



@implementation WhatFeelingVC_OLD

- (IBAction)bad:(id)sender {
    [self performSegueWithIdentifier:@"showSymptomsScene" sender:nil];
}

- (IBAction)goodOrBad:(id)sender {
    [self performSegueWithIdentifier:@"showSymptomsScene" sender:nil];
}

- (IBAction)good:(id)sender {

//    CareHistory.add("Tout va bien", atDate: NSDate())

    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    //[self performSegueWithIdentifier:@"showSymptomsScene" sender:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
