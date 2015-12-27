# AXStylishNavigationBar

AXStylishNavigationBar is a NavigationBar category can let you dynamically change the background color, image, blur effect.

## Usage

Change the default blur effect alpha of NavigationBar.

```
 [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
 [self.navigationController.navigationBar ax_setBackgroundColorAlpha:anAlpha];
```

![](https://github.com/Alchemistxxd/AXStylishNavigationBar/blob/master/Screenshots/BGBlur.gif)

Change the background color. 

```
[self.navigationController.navigationBar ax_setBackgroundColor:aColor];
```

![](https://github.com/Alchemistxxd/AXStylishNavigationBar/blob/master/Screenshots/BGColor.gif)

If you want to change the background image and also about background color of it (.png file type only), just use: 

```
- (void)ax_setBackgroundImage:(UIImage *)backgroundImage forBarMetrics:(UIBarMetrics)barMetrics;
- (void)ax_setBackgroundImageBackgroundColor:(UIColor *)aColor;
```

and if you want to remove the image, you have to do this:

```
[self.navigationController.navigationBar ax_clearBackgroundImage];
```

![](https://github.com/Alchemistxxd/AXStylishNavigationBar/blob/master/Screenshots/BGImage.gif)

You can also change the alpha of navigation items, backIndicator and the position of navigationBar.

![](https://github.com/Alchemistxxd/AXStylishNavigationBar/blob/master/Screenshots/ItemAlpha.gif)

More details are in the demo.

## Installation

```
#import "UINavigationBar+AXStylish.h"
```

Or

```
$ pod setup
$ pod search AXStylishNavigationBar
```

## License

MIT