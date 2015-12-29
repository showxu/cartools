//
//  UITableViewCell+ConfigureCellData.m
//  Demo
//
//  Created by XuXudong on 15/12/29.
//  Copyright © 2015年 Alchemistxxd. All rights reserved.
//

#import "UITableViewCell+ConfigureCellData.h"

@implementation UITableViewCell (ConfigureCellData)

- (void)configureData:(NSDictionary *)aDict
{
    self.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
    self.textLabel.shadowColor = [UIColor colorWithWhite:0.702 alpha:1.000];
    self.textLabel.shadowOffset = CGSizeMake(1.0, 1.0);
    self.textLabel.text = aDict[@"title"];
    self.detailTextLabel.text = aDict[@"platform(s)"];
}

@end
