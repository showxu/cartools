//
//  AXDetailViewController.m
//  Demo
//
//  Created by XuXudong on 15/12/12.
//  Copyright © 2015年 Alchemistxxd. All rights reserved.
//

#import "AXDetailViewController.h"
#import "UINavigationBar+AXStylish.h"

@interface AXDetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *storyLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewTopSpaceToSuperView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewBottomSpaceToStoryLabel;

@end

@implementation AXDetailViewController

#pragma mark - View Controller Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.delegate = self;
    self.imageView.image = [UIImage imageNamed:self.content[@"coverImageName"]];
    [self configStoryLabel:self.storyLabel];
}

- (void)configStoryLabel:(UILabel *)label
{
    NSDictionary *attributeDict = @{NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote], NSUnderlineStyleAttributeName:@1};
    label.attributedText = [[NSAttributedString alloc] initWithString: self.content[@"story"] attributes:attributeDict];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self configContainerViewHeight];
}

- (void)configContainerViewHeight
{
    CGSize storyLabelSize = [self.storyLabel sizeThatFits:CGSizeMake(CGRectGetWidth(self.storyLabel.bounds), CGFLOAT_MAX)];
    self.containerViewHeightConstraint.constant = self.imageViewTopSpaceToSuperView.constant + CGRectGetHeight(self.imageView.bounds) + self.imageViewBottomSpaceToStoryLabel.constant + storyLabelSize.height - CGRectGetHeight(self.containerView.superview.bounds);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    switch (_bgMode)
    {
        case AXBGBlur:
            [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
            [self.navigationController.navigationBar ax_setBlurBackgroundAlpha:0.000];
            break;
        case AXBGColor:
            [self.navigationController.navigationBar ax_setBackgroundColor:[UIColor colorWithWhite:0.800 alpha:1.000]];
            break;
        case AXBGImage:
        {
            // If the filetype is .png, iOS will not resize it for UINavigationbar, it should be manually resized.
            UIImage *logoImg = [[UIImage imageNamed:_content[@"logoImageName"]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, CGFLOAT_MAX, CGFLOAT_MAX)];
            [self.navigationController.navigationBar ax_setBackgroundImage:logoImg forBarMetrics:UIBarMetricsDefault];
            [self.navigationController.navigationBar ax_setBackgroundImageBackgroundColor:[UIColor blackColor]];
            break;
        }
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat autoAdjustInset = 32 * (1 + UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation]));
    CGFloat offsetY = scrollView.contentOffset.y + autoAdjustInset;
    CGFloat alpha = offsetY / autoAdjustInset;
    if (offsetY > 0)
    {
        [self.navigationController.navigationBar ax_selfOffCenteringOffsetX:0 offsetY:MAX(- 44, MIN(0, autoAdjustInset - offsetY))];
        [self.navigationController.navigationBar ax_setBackIndicatorViewAlpha:1.8 - alpha];
        switch (self.bgMode)
        {
            case AXBGBlur:
                [self.navigationController.navigationBar ax_setBlurBackgroundAlpha:MIN(alpha, 0.999)];
                break;
            case AXBGColor:
                [self.navigationController.navigationBar ax_setBackgroundColorAlpha:MIN(alpha, 0.900)];
                break;
            case AXBGImage:
                [self.navigationController.navigationBar ax_setBackgroundImageBackgroundColorAlpha:MIN(alpha, 0.900)];
                 break;
        }
    }
    else
    {
        [self.navigationController.navigationBar ax_selfOffCenteringOffsetX:0 offsetY:0];
        [self.navigationController.navigationBar ax_setBackIndicatorViewAlpha:1];
        switch (self.bgMode)
        {
            case AXBGBlur:
                [self.navigationController.navigationBar ax_setBlurBackgroundAlpha:0.000];
                break;
            case AXBGColor:
                [self.navigationController.navigationBar ax_setBackgroundColorAlpha:0.000];
                 break;
            case AXBGImage:
                [self.navigationController.navigationBar ax_setBackgroundImageBackgroundColorAlpha:0.000];
                break;
        }
    }
}

@end
