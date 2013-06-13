//
//  MWProgressHUD.m
//  MWPhotoBrowser
//
//  Created by Gia on 6/13/13.
//
//

#import "MWProgressHUD.h"

@interface MWProgressHUD ()

@property (nonatomic, strong) UIActivityIndicatorView *activityView;

@end

@implementation MWProgressHUD

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initInView:(UIView *)view{
    self = [super initWithFrame:CGRectMake(0, 0, 120, 120)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.center = CGPointMake(view.frame.size.width/2,
                                  view.frame.size.height/2);
        
        self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        self.activityView.center = CGPointMake(self.frame.size.width/2,
                                               self.frame.size.height/2);
        self.activityView.hidesWhenStopped = YES;
        [self addSubview:self.activityView];
        
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                               0,
                                                               self.frame.size.width,
                                                               30)];
        self.label.center = CGPointMake(self.frame.size.width/2,
                                        self.frame.size.height-self.label.frame.size.height/2);
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.backgroundColor = [UIColor clearColor];
        self.label.textColor = [UIColor whiteColor];
        [self addSubview:self.label];
        
        self.hidden = YES;
    }
    return self;
}

- (void)show{
    self.hidden = NO;
    self.customView.hidden = YES;
    [self.activityView startAnimating];
}

- (void)showCustomView{
    self.hidden = NO;
    self.customView.hidden = NO;
    self.activityView.hidden = YES;
}

- (void)hide{
    self.hidden = YES;
    self.customView.hidden = YES;
    self.activityView.hidden = YES;
    [self.activityView stopAnimating];
}

- (void)setCustomView:(UIView *)customView{
    [_customView removeFromSuperview];
    _customView = customView;
    _customView.center = CGPointMake(self.frame.size.width/2,
                                     self.frame.size.height/2);
    _customView.hidden = YES;
    [self addSubview:_customView];
}

- (void)drawRect:(CGRect)rect{
    UIColor *blackColor = [UIColor blackColor];
    [blackColor setFill];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:30];
    [path fill];
}



@end
