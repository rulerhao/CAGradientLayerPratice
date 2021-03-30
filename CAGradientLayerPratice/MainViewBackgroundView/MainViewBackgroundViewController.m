//
//  MainViewBackgroundViewController.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/29.
//

#import "MainViewBackgroundViewController.h"
#import "MainViewBackgroundView.h"
#import "MainViewBackgroundViewSetting.h"

@interface MainViewBackgroundViewController ()

@end

@implementation MainViewBackgroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void) initView {
    MainViewBackgroundView *mainViewBackgroundView = [[MainViewBackgroundView alloc] init];
    [mainViewBackgroundView entranceMethod:self.view];
}
@end
