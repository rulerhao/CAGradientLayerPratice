//
//  ViewController.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/19.
//

#import "ViewController.h"
#import "LogInView.h"
#import "LoadingView.h"
#import "BackgroundView.h"
#import "TitleBarViewController.h"
#import "SensorLargeSizeViewController.h"
#import <math.h>
#import <Masonry.h>
@interface ViewController ()

@property (strong, nonatomic) CAGradientLayer *GradientTestLayer;
@property (strong, nonatomic) TitleBarViewController *titleBarViewController;
@property (strong, nonatomic) SensorLargeSizeViewController *sensorLargeSizeViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BackgroundView *backgroundView = [BackgroundView alloc];
    [backgroundView entranceMethod:self.view];
//    LogInView *logInView = [LogInView alloc];
//    [logInView entranceMethod:self.view];
    
//    LoadingView *loadingView = [LoadingView alloc];
//    [loadingView entranceMethod:self.view];
    //--
    self.titleBarViewController = [[TitleBarViewController alloc] init];
    [self.titleBarViewController.view setAutoresizingMask:UIViewAutoresizingNone];
    [self.titleBarViewController.view setUserInteractionEnabled:YES];
    [self addChildViewController:self.titleBarViewController];

    [self.view addSubview:self.titleBarViewController.view];
    [self.titleBarViewController didMoveToParentViewController:self];

    [self.titleBarViewController.view setHidden:NO];

    [self.titleBarViewController.view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.18);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];

    [self.titleBarViewController initView];
    //--
    self.sensorLargeSizeViewController = [[SensorLargeSizeViewController alloc] init];
    [self.sensorLargeSizeViewController.view setAutoresizingMask:UIViewAutoresizingNone];
    [self.sensorLargeSizeViewController.view setUserInteractionEnabled:YES];
    [self addChildViewController:self.sensorLargeSizeViewController];
    
    [self.view addSubview:self.sensorLargeSizeViewController.view];
    [self.sensorLargeSizeViewController didMoveToParentViewController:self];
    
    [self.sensorLargeSizeViewController.view setHidden:NO];
    
    [self.sensorLargeSizeViewController.view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.view.mas_height).multipliedBy(0.82);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    [self.sensorLargeSizeViewController initView];
}


@end
