//
//  HistoryVC.m
//  Observam
//
//  Created by Mathieu Godart on 20/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

#import "HistoryVC.h"
#import "AppDelegate.h"

@interface HistoryVC ()
@property (strong, nonatomic) IBOutlet UILabel *headerLbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButtonItem;
@end



// TODO: move in a data class.

const NSString *kDate = @"date";
const NSString *kDisplayDescription = @"displayDescription";

NSDictionary *careHistory;

#warning Rewrite with pipe blocks.

NSArray *caresForGroupId(NSUInteger groupId) {

    NSArray *allDates = careHistory.allKeys;

    if (groupId >= allDates.count) return nil;

    NSArray *sortedDates =
    [allDates sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2)
     {
         return [obj2 compare:obj1];
     }];

    NSDate *careDateForGroupId = sortedDates[groupId];
    NSArray *caresForDate = [careHistory objectForKey:careDateForGroupId];

    NSArray *sortedCaresForDate =
    [caresForDate sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2)
     {
         return [obj2[kDate] compare:obj1[kDate]];
     }];

    return sortedCaresForDate;
}

NSDateFormatter *relativeDateFormatter;
NSDateFormatter *timeFormatter;



@implementation HistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

    relativeDateFormatter = [[NSDateFormatter alloc] init];
    relativeDateFormatter.locale = [NSLocale currentLocale];
    relativeDateFormatter.timeStyle = NSDateFormatterNoStyle;
    relativeDateFormatter.dateStyle = NSDateFormatterMediumStyle;
    relativeDateFormatter.doesRelativeDateFormatting = YES;

    timeFormatter = [[NSDateFormatter alloc] init];
    timeFormatter.locale = [NSLocale currentLocale];
    timeFormatter.timeStyle = NSDateFormatterShortStyle;
    timeFormatter.dateStyle = NSDateFormatterNoStyle;

    careHistory =
    @{
      [NSDate date]: @[
              @{kDate: [NSDate date],
                kDisplayDescription: @"Un peu fatigué (2/5)"},
              @{kDate: [NSDate dateWithTimeIntervalSinceNow:-60],
                kDisplayDescription: @"Prise du traitement"},
              ],
      [NSDate dateWithTimeIntervalSinceNow:-60*60*24]: @[
              @{kDate: [NSDate dateWithTimeIntervalSinceNow:-60*60*24.2],
                kDisplayDescription: @"Prise du traitement"},
              @{kDate: [NSDate dateWithTimeIntervalSinceNow:-60*60*28.6],
                kDisplayDescription: @"Oubli du traitement"},
              @{kDate: [NSDate dateWithTimeIntervalSinceNow:-60*60*28.34],
                kDisplayDescription: @"Tout va bien"},
              ],
      };

//    careHistoryGrouped = careHistory.map
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return careHistory.count;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [caresForGroupId(section) count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"historyCell"
                                                            forIndexPath:indexPath];

    NSDictionary *careLine = caresForGroupId(indexPath.section)[indexPath.row];

    cell.detailTextLabel.text = [timeFormatter stringFromDate:careLine[kDate]];
    cell.textLabel.text = careLine[kDisplayDescription];

    return cell;
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    NSDate *careDate = caresForGroupId(section).firstObject[kDate];
    return [relativeDateFormatter stringFromDate:careDate];
}



- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view
       forSection:(NSInteger)section {

    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:[AppD globalTintColor]];
}



#pragma mark - Navigation



- (IBAction)share:(id)sender {

    UIAlertController* alert =
    [UIAlertController alertControllerWithTitle:@"Partager votre historique"
                                        message:nil
                                 preferredStyle:UIAlertControllerStyleActionSheet];

    [alert addAction:[UIAlertAction actionWithTitle:@"Envoyer à votre médecin…"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {}]];

    [alert addAction:[UIAlertAction actionWithTitle:@"Envoyer à un proche…"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {}]];

    [alert addAction:[UIAlertAction actionWithTitle:@"Annuler"
                                              style:UIAlertActionStyleCancel
                                            handler:^(UIAlertAction * action) {}]];

    alert.view.tintColor = [AppD globalTintColor];

    [self presentViewController:alert animated:YES completion:nil];
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}



@end
