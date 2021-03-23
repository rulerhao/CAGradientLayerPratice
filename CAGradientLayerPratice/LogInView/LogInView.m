//
//  LogInView.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/19.
//

#import "LogInView.h"
#import <Masonry/Masonry.h>
#import "LoginViewSetting.h"

@interface LogInView ()
{
    LoginViewSetting *logInViewSetting;
}
@property (strong, nonatomic) UIView *Content_View;

@property (assign, nonatomic) CGSize View_Size;
@property (assign, nonatomic) CGSize Safe_Area_Size;

@property (strong, nonatomic) UILabel *Log_In_Title_Label;
@property (strong, nonatomic) UILabel *Log_In_Description_Label;

@property (strong, nonatomic) UILabel *Log_In_Account_Title_Label;
@property (strong, nonatomic) UITextField *Log_In_Account_Content_TextField;
@property (strong, nonatomic) UIView *Log_In_Account_Bottom_View;

@property (strong, nonatomic) UILabel *Log_In_Password_Title_Label;
@property (strong, nonatomic) UITextField *Log_In_Password_Content_TextField;
@property (strong, nonatomic) UIView *Log_In_Password_Bottom_View;

@property (strong, nonatomic) UIButton *Log_In_Button;

@end
@implementation LogInView

- (void) entranceMethod : (UIView *) Content_View {
    logInViewSetting = [[LoginViewSetting alloc] init];
    
    self.Content_View = Content_View;
    
    NSLog(@"self.view.height = %f", self.Content_View.bounds.size.height);
    NSLog(@"self.view.safe.height = %f", self.Content_View.safeAreaLayoutGuide.layoutFrame.size.height);
    
    UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
    // Whole View Size (Contain sensor housing, home indicator)
    NSLog(@"window.screen.bounds.size.height = %f", window.screen.bounds.size.height);
    NSLog(@"window.screen.bounds.size.width = %f", window.screen.bounds.size.width);
    
    self.View_Size = CGSizeMake(window.screen.bounds.size.width, window.screen.bounds.size.height);
    // View without home indicator and sensor housing
    NSLog(@"window.safeAreaInsetstest_height = %f", window.safeAreaLayoutGuide.layoutFrame.size.height);
    NSLog(@"window.safeAreaInsetstest_width = %f", window.safeAreaLayoutGuide.layoutFrame.size.width);
    
    self.Safe_Area_Size = CGSizeMake(window.safeAreaLayoutGuide.layoutFrame.size.width, window.safeAreaLayoutGuide.layoutFrame.size.height);
    
    [self viewInit];
    
    [self updateConstraints];
    
    [self writeLayers];
}

- (void) viewInit {
    
    //--------------------- Log In Title Label -----------------------
    self.Log_In_Title_Label = [[UILabel alloc] init];
    self.Log_In_Title_Label.text = logInViewSetting.Log_In_Title_Label_Text;
    self.Log_In_Title_Label.textColor = logInViewSetting.Log_In_Title_Label_Text_Color;
    self.Log_In_Title_Label.font = logInViewSetting.Log_In_Title_Label_Text_Font;
    [self.Content_View addSubview:self.Log_In_Title_Label];
    
    //--------------------- Log In Description Label -----------------------
    self.Log_In_Description_Label = [[UILabel alloc] init];
    self.Log_In_Description_Label.text = logInViewSetting.Log_In_Description_Label_Text;
    self.Log_In_Description_Label.textColor = logInViewSetting.Log_In_Description_Label_Text_Color;
    self.Log_In_Description_Label.font = logInViewSetting.Log_In_Description_Label_Text_Font;
    [self.Content_View addSubview:self.Log_In_Description_Label];
    
    //--------------------- Log In Account Title Label -----------------------
    self.Log_In_Account_Title_Label = [[UILabel alloc] init];
    self.Log_In_Account_Title_Label.text = logInViewSetting.Log_In_Account_Title_Text;
    self.Log_In_Account_Title_Label.textColor = logInViewSetting.Log_In_Account_Title_Text_Color;
    self.Log_In_Account_Title_Label.font = logInViewSetting.Log_In_Account_Title_Text_Font;
    [self.Content_View addSubview:self.Log_In_Account_Title_Label];
    
    //--------------------- Log In Account Content TextField -----------------------
    self.Log_In_Account_Content_TextField = [[UITextField alloc] init];
    self.Log_In_Account_Content_TextField.text = logInViewSetting.Log_In_Account_Content_Text;
    self.Log_In_Account_Content_TextField.textColor = logInViewSetting.Log_In_Account_Content_Text_Color;
    self.Log_In_Account_Content_TextField.font = logInViewSetting.Log_In_Account_Content_Text_Font;
    [self.Content_View addSubview:self.Log_In_Account_Content_TextField];
    
    //--------------------- Log In Account Bottom View -----------------------
    self.Log_In_Account_Bottom_View = [[UIView alloc] init];
    [self.Content_View addSubview:self.Log_In_Account_Bottom_View];
    
    //--------------------- Log In Password Title Label -----------------------
    self.Log_In_Password_Title_Label = [[UILabel alloc] init];
    self.Log_In_Password_Title_Label.text = logInViewSetting.Log_In_Password_Title_Text;
    self.Log_In_Password_Title_Label.textColor = logInViewSetting.Log_In_Password_Title_Text_Color;
    self.Log_In_Password_Title_Label.font = logInViewSetting.Log_In_Password_Title_Text_Font;
    [self.Content_View addSubview:self.Log_In_Password_Title_Label];
    
    //--------------------- Log In Password Content TextField -----------------------
    self.Log_In_Password_Content_TextField = [[UITextField alloc] init];
    self.Log_In_Password_Content_TextField.text = logInViewSetting.Log_In_Password_Content_Text;
    self.Log_In_Password_Content_TextField.textColor = logInViewSetting.Log_In_Password_Content_Text_Color;
    self.Log_In_Password_Content_TextField.font = logInViewSetting.Log_In_Password_Content_Text_Font;
    [self.Content_View addSubview:self.Log_In_Password_Content_TextField];
    
    //--------------------- Log In Password Bottom View -----------------------
    self.Log_In_Password_Bottom_View = [[UIView alloc] init];
    [self.Content_View addSubview:self.Log_In_Password_Bottom_View];
    
    //--------------------- Log In Button -----------------------
    self.Log_In_Button = [[UIButton alloc] init];
    self.Log_In_Button.backgroundColor = [UIColor whiteColor];
    [self.Log_In_Button setTitle:@"LOG IN" forState:UIControlStateNormal];
    [[self.Log_In_Button titleLabel] setFont:logInViewSetting.Log_In_Botton_Text_Font];
    [[self.Log_In_Button titleLabel] setTextColor:logInViewSetting.Log_In_Botton_Font_Color];
    [self.Log_In_Button setTitleColor:logInViewSetting.Log_In_Botton_Font_Color forState:UIControlStateNormal];
    
    [self.Content_View addSubview:self.Log_In_Button];
}

- (void) updateConstraints {
    [super updateConstraints];
    
    //--------------------- Log In Title Label -----------------------
    [self.Log_In_Title_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Content_View.mas_safeAreaLayoutGuideTop).offset(logInViewSetting.Log_In_Title_Label_Top_Distance);
        make.centerXWithinMargins.equalTo(self.Content_View.mas_centerXWithinMargins);
    }];
    
    //--------------------- Log In Description Label -----------------------
    [self.Log_In_Description_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Log_In_Title_Label.mas_bottom);
        make.centerXWithinMargins.equalTo(self.Content_View.mas_centerXWithinMargins);
    }];
    
    //--------------------- Log In Account Title Label -----------------------
    [self.Log_In_Account_Title_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Log_In_Description_Label.mas_bottom);
        make.left.equalTo(self.Log_In_Account_Bottom_View.mas_left);
    }];
    
    //--------------------- Log In Account Content TextField -----------------------
    [self.Log_In_Account_Content_TextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Log_In_Description_Label.mas_bottom);
        make.centerXWithinMargins.equalTo(self.Content_View.mas_centerXWithinMargins);
    }];
    
    //--------------------- Log In Account Bottom View -----------------------
    [self.Log_In_Account_Bottom_View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Log_In_Account_Title_Label.mas_bottom);
        make.bottom.equalTo(self.Log_In_Account_Title_Label.mas_bottom);
        make.width.equalTo(self.Content_View.mas_width).multipliedBy(logInViewSetting.Log_In_Account_Bottom_View_Layer_Width_Multi);
        make.centerX.equalTo(self.Content_View.mas_centerX);
    }];
    
    //--------------------- Log In Password Title Label -----------------------
    [self.Log_In_Password_Title_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Log_In_Account_Bottom_View.mas_bottom);
        make.left.equalTo(self.Log_In_Password_Bottom_View.mas_left);
    }];
    
    //--------------------- Log In Password Content TextField -----------------------
    [self.Log_In_Password_Content_TextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Log_In_Account_Bottom_View.mas_bottom);
        make.centerXWithinMargins.equalTo(self.Content_View.mas_centerXWithinMargins);
    }];
    
    //--------------------- Log In Password Bottom View -----------------------
    [self.Log_In_Password_Bottom_View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Log_In_Password_Title_Label.mas_bottom);
        make.bottom.equalTo(self.Log_In_Password_Title_Label.mas_bottom);
        make.width.equalTo(self.Content_View.mas_width).multipliedBy(logInViewSetting.Log_In_Password_Bottom_View_Layer_Width_Multi);
        make.centerX.equalTo(self.Content_View.mas_centerX);
    }];
    
    //--------------------- Log In Button -----------------------
    [self.Log_In_Button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Log_In_Password_Bottom_View.mas_bottom);
        make.width.equalTo(self.Content_View.mas_width).multipliedBy(logInViewSetting.Log_In_Botton_Width_Multi);
        make.height.equalTo(self.Content_View.mas_height).multipliedBy(logInViewSetting.Log_In_Botton_Height_Multi);
        make.centerX.equalTo(self.Content_View.mas_centerX);
    }];
    
    [self.Content_View layoutIfNeeded];
}

- (void) writeLayers {
    UIBezierPath *Path = [[UIBezierPath alloc] init];
    //--------------------- Log In Account Bottom View Layer -----------------------
    CAShapeLayer *Log_In_Account_Buttom_Layer = [[CAShapeLayer alloc] init];
    [Path moveToPoint:CGPointMake(0, 0)];
    [Path addLineToPoint:CGPointMake(self.Log_In_Account_Bottom_View.frame.size.width, 0)];
    Log_In_Account_Buttom_Layer.path = Path.CGPath;
    Log_In_Account_Buttom_Layer.strokeColor = [[UIColor whiteColor] CGColor];
    [self.Log_In_Account_Bottom_View.layer addSublayer:Log_In_Account_Buttom_Layer];
    
    //--------------------- Log In Password Bottom View Layer -----------------------
    CAShapeLayer *Log_In_Password_Buttom_Layer = [[CAShapeLayer alloc] init];
    [Path moveToPoint:CGPointMake(0, 0)];
    [Path addLineToPoint:CGPointMake(self.Log_In_Password_Bottom_View.frame.size.width, 0)];
    Log_In_Password_Buttom_Layer.path = Path.CGPath;
    Log_In_Password_Buttom_Layer.strokeColor = [[UIColor whiteColor] CGColor];
    [self.Log_In_Password_Bottom_View.layer addSublayer:Log_In_Password_Buttom_Layer];
}
@end
