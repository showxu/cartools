//
//  UITableViewCell+ConfigureCell.m
//  Demo
//
//  Created by XuXudong on 15/12/27.
//  Copyright © 2015年 Alchemistxxd. All rights reserved.
//

#import "UITableViewCell+ConfigureCell.h"

@implementation UITableViewCell (ConfigureCell)

- (void)configData:(NSDictionary *)aDict
{
    NSShadow *shadowAttribute = [[NSShadow alloc] init];
    shadowAttribute.shadowOffset = CGSizeMake(1.0, 1.0);
    NSDictionary *attributeDict = @{NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleCallout], NSShadowAttributeName:shadowAttribute};
    self.textLabel.attributedText = [[NSAttributedString alloc] initWithString:aDict[@"title"]
                                                                    attributes:attributeDict];
    self.detailTextLabel.text = aDict[@"platform(s)"];
}

@end
