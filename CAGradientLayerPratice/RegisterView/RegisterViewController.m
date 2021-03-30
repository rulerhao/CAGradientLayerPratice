//
//  RegisterViewController.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/26.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "RegisterViewSetting.h"
@interface RegisterViewController ()
{
    RegisterViewSetting *registerViewSetting;
}
@property (strong, nonatomic) RegisterView *registerView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) initView {
    registerViewSetting = [[RegisterViewSetting alloc] init];
    
    self.registerView = [RegisterView alloc];
    self.registerView.delegate = self;
    [self.registerView entranceMethod:self.view];
}

@end
