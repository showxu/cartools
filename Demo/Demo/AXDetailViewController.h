//
//  AXDetailViewController.h
//  Demo
//
//  Created by XuXudong on 15/12/12.
//  Copyright © 2015年 Alchemistxxd. All rights reserved.
//

#import <UIKit/UIKit.h>

#define AUTO_ADJUST_INSET (32 * (1 + UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation])))

typedef NS_ENUM(NSInteger, AXBGMode)
{
    AXBGBlur, AXBGColor, AXBGImage
};

@interface AXDetailViewController : UIViewController

@property (nonatomic, strong) NSDictionary *content;
@property (nonatomic) AXBGMode bgMode;

@end
