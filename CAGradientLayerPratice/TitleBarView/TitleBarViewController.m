//
//  TitleBarViewController.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/23.
//

#import "TitleBarViewController.h"
#import "TitleBarModel.h"
#import <Masonry.h>
#import "BackgroundView.h"
@interface TitleBarViewController ()
@property (strong, nonatomic) TitleBarView *titleBarView;
@end

@implementation TitleBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    BackgroundView *backgroundView = [BackgroundView alloc];
//    [backgroundView entranceMethod:self.view];
//    self.view.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:self.titleBarView];
//    [self.view viewWithTag:1];
}

- (void) initView {
    self.titleBarView = [TitleBarView alloc];
    self.titleBarView.delegate = self;
    [self.titleBarView entranceMethod:self.view];
}

- (void) updateConstraints {
    
}

@end
