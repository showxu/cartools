//
//  AXViewController.m
//  Demo
//
//  Created by XuXudong on 15/12/12.
//  Copyright © 2015年 Alchemistxxd. All rights reserved.
//

#import "AXOverviewViewController.h"
#import "AXDetailViewController.h"
#import "UINavigationBar+AXStylish.h"
#import "AXOVCTableViewDataSource.h"
#import "UITableViewCell+ConfigureCellData.h"

static NSString * const cellIdentifier = @"cell";

@interface AXOverviewViewController () <UITableViewDelegate>

@property (nonatomic, copy) NSArray *cellData;
@property (nonatomic, strong) AXOVCTableViewDataSource *tableViewDataSource;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation AXOverviewViewController

#pragma mark - View Controller Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.ax_showShadowView = NO;
    [self fetchTestData];
    [self configureTableView];
}

- (void)fetchTestData
{
    NSString *cellDataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *cellData = [NSData dataWithContentsOfFile:cellDataFilePath];
    NSError *error;
    NSDictionary *cellDataDict = [NSJSONSerialization JSONObjectWithData:cellData options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"%@", error);
    self.cellData = cellDataDict[@"Metal Gear"];
}

- (void)configureTableView
{
    self.tableView.estimatedRowHeight = 48;

    self.tableViewDataSource =
        [[AXOVCTableViewDataSource alloc] initWithItems:self.cellData
                                         cellIdentifier:cellIdentifier
                                        cellConfigBlock:^(UITableViewCell *aCell, NSDictionary *aDict) {
        [aCell configureData:aDict];
    }];
    self.tableView.dataSource = self.tableViewDataSource;
    self.tableView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Metal Gear";
    [self.navigationController.navigationBar ax_clearBackgroundImage];
    [self.navigationController.navigationBar ax_setBackgroundImageBackgroundColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    [self.navigationController.navigationBar ax_setBackgroundColorAlpha:0.000];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationItem.title = @"";
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showAXDVC"])
        if ([segue.destinationViewController isKindOfClass:[AXDetailViewController class]])
        {
            AXDetailViewController *axdvc = (AXDetailViewController *)segue.destinationViewController;
            [self configureAXDVC:axdvc with:sender];
        }
}
            
- (void)configureAXDVC:(AXDetailViewController *)axdvc with:(id)sender
{
    axdvc.content = self.cellData[[_tableView indexPathForCell:sender].row];
    axdvc.bgMode = self.segmentedControl.selectedSegmentIndex;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].selected = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat autoAdjustInset = 32 * (1 + UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation]));
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat alpha = - offsetY / autoAdjustInset;
    if (offsetY > 0)
        [self.navigationController.navigationBar ax_setTitleViewAlpha:MIN(alpha, 1.000)];
    else
        [self.navigationController.navigationBar ax_setTitleViewAlpha:1.000];
}

@end
