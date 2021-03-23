//
//  TitleBarViewController.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/23.
//

#import "TitleBarViewController.h"
#import "TitleBarView.h"
#import "TitleBarModel.h"
@interface TitleBarViewController ()
@property (strong, nonatomic) TitleBarView *titleBarView;
@end

@implementation TitleBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleBarView = [TitleBarView alloc];
    [self.view addSubview:self.titleBarView];
    [self.view viewWithTag:1];
}



@end
