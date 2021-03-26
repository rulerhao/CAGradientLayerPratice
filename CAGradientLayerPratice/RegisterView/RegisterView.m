//
//  RegisterView.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/26.
//

#import "RegisterView.h"
#import "RegisterViewSetting.h"
#import <Masonry.h>

@interface RegisterView ()
{
    RegisterViewSetting *registerViewSetting;
}
@property (strong, nonatomic) UIView *Content_View;

@property (strong, nonatomic) UILabel *Registered_Device_Message_Label;
@property (strong, nonatomic) UITextField *Name_TextField;
@property (strong, nonatomic) UITextField *Bed_Number_TextField;
@property (strong, nonatomic) UIButton *Register_Button;

@end
@implementation RegisterView
- (void) entranceMethod : (UIView *) Content_View {
    registerViewSetting = [[RegisterViewSetting alloc] init];
    
    self.Content_View = Content_View;
    
    [self viewInit];
    
    [self updateConstraints];

    [self writeLayers];
}

- (void) viewInit {
    self.Registered_Device_Message_Label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.Registered_Device_Message_Label.text = @"未連接\n未註冊裝置";
    self.Registered_Device_Message_Label.lineBreakMode = NSLineBreakByWordWrapping;
    self.Registered_Device_Message_Label.numberOfLines = 0;
    self.Registered_Device_Message_Label.backgroundColor = [UIColor whiteColor];
    self.Registered_Device_Message_Label.textColor = [UIColor greenColor];
    self.Registered_Device_Message_Label.font = [UIFont fontWithName:@"Helvetica" size:registerViewSetting.Registered_Device_Message_Label_Text_Size];
    self.Registered_Device_Message_Label.textAlignment = registerViewSetting.Registered_Device_Message_Label_TextAlignment;
    
    [self.Content_View addSubview:self.Registered_Device_Message_Label];
}

- (void) updateConstraints {
    [super updateConstraints];
    
    //--------------------- Registered Device Message Label -----------------------
    [self.Registered_Device_Message_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Content_View.mas_top);
        make.centerX.equalTo(self.Content_View.mas_centerX);
        make.width.equalTo(self.Content_View.mas_width).multipliedBy(registerViewSetting.Registered_Device_Message_Label_Width_Ratio);
    }];
    
}

- (void) writeLayers {
    
}
@end
