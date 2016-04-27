//
//  TodayVC.m
//  Observam
//
//  Created by Mathieu Godart on 11/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

#import "TodayVC.h"
#import "AppDelegate.h"

@interface TodayVC ()
@property (strong, nonatomic) IBOutlet UIImageView *backgroundView;
@property (strong, nonatomic) IBOutlet UITableViewCell *tipCell;
@property (strong, nonatomic) IBOutlet UILabel *tipOfTheDay;
@end



@implementation TodayVC



- (void)viewDidAppear:(BOOL)animated {
//    [self performSegueWithIdentifier:@"showTakeDrugScene" sender:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.estimatedRowHeight = 44;

    self.tipOfTheDay.text = @"Natus voluptatibus ut fuga qui accusamus. Eum corporis sint incidunt corporis mito hecta ipsum.";

    self.tableView.backgroundView = self.backgroundView;
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


