//
//  DrugLeftVC.m
//  Observam
//
//  Created by Mathieu Godart on 18/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

#import "DrugLeftVC.h"

@interface DrugLeftVC ()

@end



@implementation DrugLeftVC



- (void)viewDidAppear:(BOOL)animated {
    [self performSegueWithIdentifier:@"showWhatFeelingScene" sender:nil];
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