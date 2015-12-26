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

@end

@implementation AXDetailViewController

#pragma mark - View Controller Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    _scrollView.delegate = self;
    _imageView.image = [UIImage imageNamed:_content[@"coverImageName"]];
    [self configStoryLabel:_storyLabel];
}

- (void)configStoryLabel:(UILabel *)label
{
    NSDictionary *attributeDict = @{NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote], NSUnderlineStyleAttributeName:@1};
    label.attributedText = [[NSAttributedString alloc] initWithString: _content[@"story"] attributes:attributeDict];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self configContainerViewHeight];
}

- (void)configContainerViewHeight
{
    CGSize storyLabelSize = [_storyLabel sizeThatFits:CGSizeMake(CGRectGetWidth(_storyLabel.bounds), CGFLOAT_MAX)];
    _containerViewHeightConstraint.constant = storyLabelSize.height + CGRectGetHeight(_imageView.bounds) + 8 + 20 - CGRectGetHeight(_containerView.superview.bounds);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    switch (_bgMode) {
        case AXBGBlur: {
            [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
            [self.navigationController.navigationBar ax_setBlurBackgroundAlpha:0.000];
            break;
        }
        case AXBGColor: {
            [self.navigationController.navigationBar ax_setBackgroundColor:[UIColor colorWithWhite:0.800 alpha:1.000]];
            break;
        }
        case AXBGImage: {
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
    CGFloat offsetY = scrollView.contentOffset.y + AUTO_ADJUST_INSET;
    CGFloat alpha = offsetY / AUTO_ADJUST_INSET;
    if (offsetY > 0)
    {
        [self.navigationController.navigationBar ax_selfOffCenteringOffsetX:0 offsetY:MAX(- 44, MIN(0, AUTO_ADJUST_INSET - offsetY))];
        [self.navigationController.navigationBar ax_setBackIndicatorViewAlpha:2 - alpha];
        switch (_bgMode) {
            case AXBGBlur: {
                [self.navigationController.navigationBar ax_setBlurBackgroundAlpha:MIN(alpha, 0.999)];
                break;
            }
            case AXBGColor: {
                [self.navigationController.navigationBar ax_setBackgroundColorAlpha:MIN(alpha, 0.900)];
                break;
            }
            case AXBGImage: {
                [self.navigationController.navigationBar ax_setBackgroundImageBackgroundColorAlpha:MIN(alpha, 0.900)];
                 break;
            }
        }
    }
    else
    {
        [self.navigationController.navigationBar ax_selfOffCenteringOffsetX:0 offsetY:0];
        [self.navigationController.navigationBar ax_setBackIndicatorViewAlpha:1];
        switch (_bgMode) {
            case AXBGBlur: {
                [self.navigationController.navigationBar ax_setBlurBackgroundAlpha:0.000];
                break;
            }
            case AXBGColor: {
                [self.navigationController.navigationBar ax_setBackgroundColorAlpha:0.000];
                 break;
            }
            case AXBGImage: {
                [self.navigationController.navigationBar ax_setBackgroundImageBackgroundColorAlpha:0.000];
                break;
            }
        }
    }
}

@end
