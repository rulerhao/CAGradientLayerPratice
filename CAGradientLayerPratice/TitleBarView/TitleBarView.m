//
//  TitleBarView.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/22.
//

#import "TitleBarView.h"
#import <Masonry.h>
@interface TitleBarView ()

@property (strong, nonatomic) UIView *Content_View;

@end

@implementation TitleBarView
typedef NS_ENUM(NSInteger, FunctionButtonEnum){
    ButtonHaveNotThing = -1,
    SensorController = 1,
    RegisterController = 2
};

- (void) entranceMethod : (UIView *) Content_View {
    self.Content_View = Content_View;
    
    [self viewInit];

    [self updateConstraints];

    [self writeLayers];
}

- (void) viewInit {
    
    //--------------------- Log In Title Label -----------------------
    UIButton *LeftButton = [[UIButton alloc] init];
    UIButton *RightButton = [[UIButton alloc] init];
    
    for(int i = 0; i < 2; i++) {
        UIButton *button = [[UIButton alloc] init];
        [button addTarget:self action:@selector(touchedButton:) forControlEvents:UIControlEventTouchUpInside];
        [button setTag:i];
        [button setBackgroundColor:[UIColor blackColor]];
        [self.Content_View addSubview:button];
    }
}

- (void) updateConstraints {
    [super updateConstraints];
    
    //--------------------- Log In Title Label -----------------------
    UIButton *Left_Button = [UIButton alloc];
    Left_Button = [self.Content_View viewWithTag:0];
    
    [Left_Button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Content_View.mas_safeAreaLayoutGuideTop);
        make.height.equalTo(self.Content_View.mas_height).multipliedBy(0.2);
        make.left.equalTo(self.Content_View.mas_safeAreaLayoutGuideLeft);
        make.right.equalTo(self.Content_View.mas_safeAreaLayoutGuideRight);
    }];
    
    UIButton *Right_Button = [UIButton alloc];
    Right_Button = [self.Content_View viewWithTag:1];
    
    [Right_Button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Content_View.mas_safeAreaLayoutGuideTop);
        make.height.equalTo(self.Content_View.mas_height).multipliedBy(0.2);
        make.left.equalTo(self.Content_View.mas_safeAreaLayoutGuideLeft);
        make.right.equalTo(self.Content_View.mas_safeAreaLayoutGuideRight);
    }];
    
    [self.Content_View layoutIfNeeded];
}

- (void) writeLayers {
}
@end
