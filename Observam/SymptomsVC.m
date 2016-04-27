//
//  SymptomsVC.m
//  Observam
//
//  Created by Mathieu Godart on 11/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

#import "SymptomsVC.h"

@interface SymptomsVC ()

@end



@implementation SymptomsVC



- (void)viewDidAppear:(BOOL)animated {
    [self performSegueWithIdentifier:@"showFeelingTextScene" sender:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
