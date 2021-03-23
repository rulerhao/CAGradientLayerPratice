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
#import <math.h>
@interface ViewController ()

@property (strong, nonatomic) CAGradientLayer *GradientTestLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BackgroundView *backgroundView = [BackgroundView alloc];
    [backgroundView entranceMethod:self.view];
    LogInView *logInView = [LogInView alloc];
    [logInView entranceMethod:self.view];
    
//    LoadingView *loadingView = [LoadingView alloc];
//    [loadingView entranceMethod:self.view];
}


@end
