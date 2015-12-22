//
//  ViewController.m
//  Demo
//
//  Created by XuXudong on 15/12/12.
//  Copyright © 2015年 Alchemistxxd. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+AXStylish.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.navigationController.navigationBar.ax_ShowShadowImage = NO;
    [self.navigationController.navigationBar ax_setBackgroudColor:[UIColor colorWithRed:0.886 green:0.235 blue:0.125 alpha:0.000]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0)
    {
        CGFloat alpha = MIN(1, 1 - ((64 - offsetY) / 64));
        [self.navigationController.navigationBar ax_setBackgroundColorAlpha:alpha];
    }
    else
        [self.navigationController.navigationBar ax_setBackgroundColorAlpha:0.000];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 18;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"Row %ld", indexPath.row];
    return cell;
}

@end
