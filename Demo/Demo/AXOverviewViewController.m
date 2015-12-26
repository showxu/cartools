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

@interface AXOverviewViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray *cellData;
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
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 48;
    [self fetchTestData];
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

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [self configCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configCell:(UITableViewCell *)aCell atIndexPath:(NSIndexPath *)indexPath
{
    NSShadow *shadowAttribute = [[NSShadow alloc] init];
    shadowAttribute.shadowOffset = CGSizeMake(1.0, 1.0);
    NSDictionary *attributeDict = @{NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleCallout],
                                    NSShadowAttributeName:shadowAttribute};
    aCell.textLabel.attributedText = [[NSAttributedString alloc] initWithString:_cellData[indexPath.row][@"title"]
                                                                     attributes:attributeDict];
    aCell.detailTextLabel.text = _cellData[indexPath.row][@"platform(s)"];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].selected = NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showAXDVC"])
        if ([segue.destinationViewController isKindOfClass:[AXDetailViewController class]])
        {
            AXDetailViewController *AXDVC = (AXDetailViewController *)segue.destinationViewController;
            AXDVC.content = _cellData[[_tableView indexPathForCell:sender].row];
            AXDVC.bgMode = _segmentedControl.selectedSegmentIndex;
        }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offsetY = scrollView.contentOffset.y + AUTO_ADJUST_INSET;
    CGFloat navigationBarHeight = CGRectGetHeight(self.navigationController.navigationBar.bounds);
    CGFloat alpha = (navigationBarHeight - offsetY) / navigationBarHeight;
    if (offsetY > 0)
        [self.navigationController.navigationBar ax_setTitleViewAlpha:MIN(alpha, 1.000)];
    else
        [self.navigationController.navigationBar ax_setTitleViewAlpha:1.000];
}

@end
