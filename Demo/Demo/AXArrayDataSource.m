//
//  AXArrayDataSource.m
//  Demo
//
//  Created by XuXudong on 15/12/27.
//  Copyright © 2015年 Alchemistxxd. All rights reserved.
//

#import "AXArrayDataSource.h"

@interface AXArrayDataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) AXTableViewCellConfigBlock configWithBlock;

@end

@implementation AXArrayDataSource

#pragma mark - Initialization
- (instancetype)initWithItems:(NSArray *)items cellIdentifier:(NSString *)aCellIdentifier cellconfigBlock:(AXTableViewCellConfigBlock)aCellConfigBlock
{
    self = [super init];
    if (self)
    {
        self.items = items;
        self.cellIdentifier = aCellIdentifier;
        self.configWithBlock = aCellConfigBlock;
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    id item = [self objectInItemsAtIndexPath:indexPath];
    self.configWithBlock(cell, item);
    return cell;
}

- (id)objectInItemsAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[indexPath.row];
}

@end
