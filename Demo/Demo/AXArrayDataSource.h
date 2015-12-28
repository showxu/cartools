//
//  AXArrayDataSource.h
//  Demo
//
//  Created by XuXudong on 15/12/27.
//  Copyright © 2015年 Alchemistxxd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^AXTableViewCellConfigBlock)(id cell, id item);

@interface AXArrayDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithItems:(NSArray *)items
               cellIdentifier:(NSString *)aCellIdentifier
              cellconfigBlock:(AXTableViewCellConfigBlock)block;

@end
