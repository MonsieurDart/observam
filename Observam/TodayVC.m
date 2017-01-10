//
//  TodayVC.m
//  Observam
//
//  Created by Mathieu Godart on 11/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

#import "TodayVC.h"
#import "AppDelegate.h"

@interface TodayVC_OLD ()
@property (strong, nonatomic) IBOutlet UIImageView *backgroundView;
@property (strong, nonatomic) IBOutlet UITableViewCell *tipCell;
@property (strong, nonatomic) IBOutlet UILabel *tipOfTheDay;
@end



@implementation TodayVC_OLD



- (void)viewDidAppear:(BOOL)animated {
//    [self performSegueWithIdentifier:@"showTakeDrugScene" sender:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.estimatedRowHeight = 44;

    self.tipOfTheDay.text = @"Lavez-vous les mains avant et après chaque fois que vous avez touché les comprimés.";

    self.tableView.backgroundView = self.backgroundView;
}



- (IBAction)relaunchWizard:(id)sender {
//    globalIsWizardCompleted = false
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}



- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view
       forSection:(NSInteger)section {

    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:[AppD globalTintColor]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end


