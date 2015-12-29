//
//  AXArrayDataSource.m
//  Demo
//
//  Created by XuXudong on 15/12/27.
//  Copyright © 2015年 Alchemistxxd. All rights reserved.
//

#import "AXOVCTableViewDataSource.h"

@interface AXOVCTableViewDataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) void (^configBlock)(id cell, id item);

@end

@implementation AXOVCTableViewDataSource

#pragma mark - Initialization
- (instancetype)initWithItems:(NSArray *)items cellIdentifier:(NSString *)aCellIdentifier cellConfigBlock:(void (^)(id, id))congfigBlock
{
    self = [super init];
    if (self)
    {
        self.items = items;
        self.cellIdentifier = aCellIdentifier;
        self.configBlock = congfigBlock;
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
    self.configBlock(cell, item);
    return cell;
}

- (id)objectInItemsAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[indexPath.row];
}

@end
