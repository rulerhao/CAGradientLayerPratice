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
#import "SensorMiddleSizeViewController.h"
#import "SensorSmallSizeViewController.h"
#import "RegisterViewController.h"
#import <math.h>
#import <Masonry.h>

@interface ViewController ()

@property (strong, nonatomic) CAGradientLayer *GradientTestLayer;
@property (strong, nonatomic) TitleBarViewController *titleBarViewController;
@property (strong, nonatomic) SensorLargeSizeViewController *sensorLargeSizeViewController;
@property (strong, nonatomic) SensorMiddleSizeViewController *sensorMiddleSizeViewController;
@property (strong, nonatomic) SensorSmallSizeViewController *sensorSmallSizeViewController;
@property (strong, nonatomic) RegisterViewController *registerViewController;
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
    //-- Large size collectionview
//    self.sensorLargeSizeViewController = [[SensorLargeSizeViewController alloc] init];
//    [self.sensorLargeSizeViewController.view setAutoresizingMask:UIViewAutoresizingNone];
//    [self.sensorLargeSizeViewController.view setUserInteractionEnabled:YES];
//    [self addChildViewController:self.sensorLargeSizeViewController];
//
//    [self.view addSubview:self.sensorLargeSizeViewController.view];
//    [self.sensorLargeSizeViewController didMoveToParentViewController:self];
//
//    [self.sensorLargeSizeViewController.view setHidden:NO];
//
//    [self.sensorLargeSizeViewController.view mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(self.view.mas_height).multipliedBy(0.82);
//        make.bottom.equalTo(self.view.mas_bottom);
//        make.left.equalTo(self.view.mas_left);
//        make.right.equalTo(self.view.mas_right);
//    }];
//
//    [self.sensorLargeSizeViewController initView];

    //-- Middle size collectionview
    self.sensorMiddleSizeViewController = [[SensorMiddleSizeViewController alloc] init];
    [self.sensorMiddleSizeViewController.view setAutoresizingMask:UIViewAutoresizingNone];
    [self.sensorMiddleSizeViewController.view setUserInteractionEnabled:YES];
    [self addChildViewController:self.sensorMiddleSizeViewController];
    
    [self.view addSubview:self.sensorMiddleSizeViewController.view];
    [self.sensorMiddleSizeViewController didMoveToParentViewController:self];
    
    [self.sensorMiddleSizeViewController.view setHidden:NO];
    
    [self.sensorMiddleSizeViewController.view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.view.mas_height).multipliedBy(0.82);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
//    [self.sensorMiddleSizeViewController initView];
    
    //-- Small size collectionview
    self.sensorSmallSizeViewController = [[SensorSmallSizeViewController alloc] init];
    [self.sensorSmallSizeViewController.view setAutoresizingMask:UIViewAutoresizingNone];
    [self.sensorSmallSizeViewController.view setUserInteractionEnabled:YES];
    [self addChildViewController:self.sensorSmallSizeViewController];
    
    [self.view addSubview:self.sensorSmallSizeViewController.view];
    [self.sensorSmallSizeViewController didMoveToParentViewController:self];
    
    [self.sensorSmallSizeViewController.view setHidden:NO];
    
    [self.sensorSmallSizeViewController.view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.view.mas_height).multipliedBy(0.82);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
//    [self.sensorSmallSizeViewController initView];
    //-- Register View
    self.registerViewController = [[RegisterViewController alloc] init];
    [self.registerViewController.view setAutoresizingMask:UIViewAutoresizingNone];
    [self.registerViewController.view setUserInteractionEnabled:YES];
    [self addChildViewController:self.registerViewController];
    
    [self.view addSubview:self.registerViewController.view];
    [self.registerViewController didMoveToParentViewController:self];
    
    [self.registerViewController.view setHidden:NO];
    
    [self.registerViewController.view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.view.mas_height).multipliedBy(0.82);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    [self.registerViewController initView];
}


@end
