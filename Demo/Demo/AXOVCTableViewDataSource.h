//
//  AXArrayDataSource.h
//  Demo
//
//  Created by XuXudong on 15/12/27.
//  Copyright © 2015年 Alchemistxxd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AXOVCTableViewDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithItems:(NSArray *)items
               cellIdentifier:(NSString *)aCellIdentifier
              cellConfigBlock:(void (^)(id aCell, id anItem))congfigBlock;

@end
