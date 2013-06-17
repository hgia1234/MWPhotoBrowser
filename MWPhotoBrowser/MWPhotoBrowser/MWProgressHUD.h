//
//  MWProgressHUD.h
//  MWPhotoBrowser
//
//  Created by Gia on 6/13/13.
//
//

#import <UIKit/UIKit.h>

@interface MWProgressHUD : UIView

@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong) UILabel *label;


- (id)initInView:(UIView *)view;

- (void)show;
- (void)showCustomView;
- (void)hide;
@end
