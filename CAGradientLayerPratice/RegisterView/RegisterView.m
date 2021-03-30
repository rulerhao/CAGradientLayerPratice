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

@property (strong, nonatomic) UIView *Not_Yet_Connect_View;
@property (strong, nonatomic) UIView *Connect_More_Than_One_View;
@property (strong, nonatomic) UIView *Connect_Exactly_One_View;

@property (strong, nonatomic) UILabel *Registered_Device_Not_Yet_Connect_Message_Label;
@property (strong, nonatomic) UILabel *Registered_Device_Connect_More_Than_One_Message_Label;
@property (strong, nonatomic) UILabel *Registered_Device_Connect_Exactly_One_Message_Label;

@property (strong, nonatomic) UIView *Name_Background_View;
@property (strong, nonatomic) UIView *Bed_Number_Background_View;

@property (strong, nonatomic) UILabel *Name_Title_Label;
@property (strong, nonatomic) UILabel *Bed_Number_Title_Label;;

@property (strong, nonatomic) UITextField *Name_TextField;
@property (strong, nonatomic) UITextField *Bed_Number_TextField;

@property (strong, nonatomic) UIButton *Register_Button;
@property (strong, nonatomic) UILabel *Register_Button_Text_Label;

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
    self.Not_Yet_Connect_View = [[UIView alloc] initWithFrame:CGRectZero];
    self.Connect_More_Than_One_View = [[UIView alloc] initWithFrame:CGRectZero];
    self.Connect_Exactly_One_View = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.Content_View addSubview:self.Not_Yet_Connect_View];
    [self.Content_View addSubview:self.Connect_More_Than_One_View];
    [self.Content_View addSubview:self.Connect_Exactly_One_View];
    
    self.Registered_Device_Not_Yet_Connect_Message_Label = registerViewSetting.Registered_Device_Not_Yet_Connect_Message_Label;
    self.Registered_Device_Connect_More_Than_One_Message_Label = registerViewSetting.Registered_Device_Connect_More_Than_One_Message_Label;
    self.Registered_Device_Connect_Exactly_One_Message_Label = registerViewSetting.Registered_Device_Connect_Exactly_One_Message_Label;
    
    [self.Not_Yet_Connect_View addSubview:self.Registered_Device_Not_Yet_Connect_Message_Label];
    [self.Connect_More_Than_One_View addSubview:self.Registered_Device_Connect_More_Than_One_Message_Label];
    [self.Connect_Exactly_One_View addSubview:self.Registered_Device_Connect_Exactly_One_Message_Label];
    
    // ------------- Name View ---------------
    self.Name_Background_View = registerViewSetting.Name_Background_View;
    self.Name_Title_Label = registerViewSetting.Name_Title_Label;
    self.Name_TextField = registerViewSetting.Name_TextField;
    [self.Connect_Exactly_One_View addSubview:self.Name_Background_View];
    [self.Connect_Exactly_One_View addSubview:self.Name_Title_Label];
    [self.Connect_Exactly_One_View addSubview:self.Name_TextField];
    
    // ------------- Bed Number View ---------------
    self.Bed_Number_Background_View = registerViewSetting.Bed_Number_Background_View;
    self.Bed_Number_Title_Label = registerViewSetting.Bed_Number_Title_Label;
    self.Bed_Number_TextField = registerViewSetting.Bed_Number_TextField;
    [self.Connect_Exactly_One_View addSubview:self.Bed_Number_Background_View];
    [self.Connect_Exactly_One_View addSubview:self.Bed_Number_Title_Label];
    [self.Connect_Exactly_One_View addSubview:self.Bed_Number_TextField];
    
    self.Not_Yet_Connect_View.hidden = YES;
    self.Connect_More_Than_One_View.hidden = NO;
    self.Connect_Exactly_One_View.hidden = YES;
    
    // ------------- Register Button ---------------
    self.Register_Button = registerViewSetting.Register_Button;
    self.Register_Button_Text_Label = registerViewSetting.Register_Button_Text_Label;
    
    [self.Connect_Exactly_One_View addSubview:self.Register_Button];
    [self.Connect_Exactly_One_View addSubview:self.Register_Button_Text_Label];
}

- (void) updateConstraints {
    [super updateConstraints];
    
    [self.Not_Yet_Connect_View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Content_View.mas_top);
        make.bottom.equalTo(self.Content_View.mas_bottom);
        make.left.equalTo(self.Content_View.mas_left);
        make.right.equalTo(self.Content_View.mas_right);
    }];
    
    [self.Connect_More_Than_One_View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Content_View.mas_top);
        make.bottom.equalTo(self.Content_View.mas_bottom);
        make.left.equalTo(self.Content_View.mas_left);
        make.right.equalTo(self.Content_View.mas_right);
    }];
    
    [self.Connect_Exactly_One_View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Content_View.mas_top);
        make.bottom.equalTo(self.Content_View.mas_bottom);
        make.left.equalTo(self.Content_View.mas_left);
        make.right.equalTo(self.Content_View.mas_right);
    }];
    
    // --------------------- Not Yet Connect Message View -----------------------------
    [self.Registered_Device_Not_Yet_Connect_Message_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Not_Yet_Connect_View.mas_bottom).multipliedBy(registerViewSetting.Registered_Device_Message_Top_Distance_Ratio);
        make.centerX.equalTo(self.Not_Yet_Connect_View.mas_centerX);
        make.width.equalTo(self.Not_Yet_Connect_View.mas_width).multipliedBy(registerViewSetting.Registered_Device_Message_Label_And_TextFiled_Width_Ratio);
    }];
    // --------------------- Connect More Than One View -----------------------------
    [self.Registered_Device_Connect_More_Than_One_Message_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Connect_More_Than_One_View.mas_bottom).multipliedBy(registerViewSetting.Registered_Device_Message_Top_Distance_Ratio);
        make.centerX.equalTo(self.Connect_More_Than_One_View.mas_centerX);
        make.width.equalTo(self.Connect_More_Than_One_View.mas_width).multipliedBy(registerViewSetting.Registered_Device_Message_Label_And_TextFiled_Width_Ratio);
    }];
    // --------------------- Connect Exactly One View -----------------------------
    [self.Registered_Device_Connect_Exactly_One_Message_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Connect_Exactly_One_View.mas_bottom).multipliedBy(registerViewSetting.Registered_Device_Message_Top_Distance_Ratio);
        make.centerX.equalTo(self.Connect_Exactly_One_View.mas_centerX);
        make.width.equalTo(self.Connect_Exactly_One_View.mas_width).multipliedBy(registerViewSetting.Registered_Device_Message_Label_And_TextFiled_Width_Ratio);
    }];
    
    // ------------- Name View ---------------
    [self.Name_Background_View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.Connect_Exactly_One_View.mas_bottom).multipliedBy(registerViewSetting.Name_View_Bottom_Position_Percentage);
        make.centerX.equalTo(self.Connect_Exactly_One_View.mas_centerX);
        make.width.equalTo(self.Connect_Exactly_One_View.mas_width).multipliedBy(registerViewSetting.Registered_Device_Message_Label_And_TextFiled_Width_Ratio);
        make.height.equalTo(self.Connect_Exactly_One_View.mas_height).multipliedBy(registerViewSetting.TextField_Height_Percentage);
    }];
    
    [self.Name_Title_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.Connect_Exactly_One_View.mas_bottom).multipliedBy(registerViewSetting.Name_View_Bottom_Position_Percentage);
        make.centerX.equalTo(self.Connect_Exactly_One_View.mas_centerX);
        make.width.equalTo(self.Connect_Exactly_One_View.mas_width).multipliedBy(registerViewSetting.Registered_Device_Message_Label_And_TextFiled_Width_Ratio);
        make.height.equalTo(self.Connect_Exactly_One_View.mas_height).multipliedBy(registerViewSetting.TextField_Height_Percentage);
    }];
    
    [self.Name_TextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.Connect_Exactly_One_View.mas_bottom).multipliedBy(registerViewSetting.Name_View_Bottom_Position_Percentage);
        make.centerX.equalTo(self.Connect_Exactly_One_View.mas_centerX);
        make.width.equalTo(self.Connect_Exactly_One_View.mas_width).multipliedBy(registerViewSetting.Registered_Device_Message_Label_And_TextFiled_Width_Ratio);
        make.height.equalTo(self.Connect_Exactly_One_View.mas_height).multipliedBy(registerViewSetting.TextField_Height_Percentage);
    }];
    
    // ------------- Bed Number View ---------------
    [self.Bed_Number_Background_View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.Connect_Exactly_One_View.mas_bottom).multipliedBy(registerViewSetting.Bed_Number_View_Bottom_Position_Percentage);
        make.centerX.equalTo(self.Connect_Exactly_One_View.mas_centerX);
        make.width.equalTo(self.Connect_Exactly_One_View.mas_width).multipliedBy(registerViewSetting.Registered_Device_Message_Label_And_TextFiled_Width_Ratio);
        make.height.equalTo(self.Connect_Exactly_One_View.mas_height).multipliedBy(registerViewSetting.TextField_Height_Percentage);
    }];
    
    [self.Bed_Number_Title_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.Connect_Exactly_One_View.mas_bottom).multipliedBy(registerViewSetting.Bed_Number_View_Bottom_Position_Percentage);
        make.centerX.equalTo(self.Connect_Exactly_One_View.mas_centerX);
        make.width.equalTo(self.Connect_Exactly_One_View.mas_width).multipliedBy(registerViewSetting.Registered_Device_Message_Label_And_TextFiled_Width_Ratio);
        make.height.equalTo(self.Connect_Exactly_One_View.mas_height).multipliedBy(registerViewSetting.TextField_Height_Percentage);
    }];
    
    [self.Bed_Number_TextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.Connect_Exactly_One_View.mas_bottom).multipliedBy(registerViewSetting.Bed_Number_View_Bottom_Position_Percentage);
        make.centerX.equalTo(self.Connect_Exactly_One_View.mas_centerX);
        make.width.equalTo(self.Connect_Exactly_One_View.mas_width).multipliedBy(registerViewSetting.Registered_Device_Message_Label_And_TextFiled_Width_Ratio);
        make.height.equalTo(self.Connect_Exactly_One_View.mas_height).multipliedBy(registerViewSetting.TextField_Height_Percentage);
    }];
    
    // ------------- Register Button ---------------
    [self.Register_Button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.Connect_Exactly_One_View.mas_bottom).multipliedBy(registerViewSetting.Register_Button_Distance_Ratio);
        make.centerX.equalTo(self.Connect_Exactly_One_View.mas_centerX);
        make.width.equalTo(self.Connect_Exactly_One_View.mas_width).multipliedBy(registerViewSetting.Register_Button_Width_Ratio);
        make.height.equalTo(self.Connect_Exactly_One_View.mas_height).multipliedBy(registerViewSetting.TextField_Height_Percentage);
    }];
    
    [self.Register_Button_Text_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.Connect_Exactly_One_View.mas_bottom).multipliedBy(registerViewSetting.Register_Button_Distance_Ratio);
        make.centerX.equalTo(self.Connect_Exactly_One_View.mas_centerX);
        make.width.equalTo(self.Connect_Exactly_One_View.mas_width).multipliedBy(registerViewSetting.Register_Button_Width_Ratio);
        make.height.equalTo(self.Connect_Exactly_One_View.mas_height).multipliedBy(registerViewSetting.TextField_Height_Percentage);
    }];
    
    [self.Content_View layoutIfNeeded];
}

- (void) writeLayers {
    //--------------------- Not Yet Register Label -----------------------
    CAShapeLayer *Not_Yet_Register_Background_Shape_Layer = [[CAShapeLayer alloc] init];
    
    UIBezierPath *Not_Yet_Register_Path1 = [[UIBezierPath alloc] init];
    Not_Yet_Register_Path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0,
                                                                         self.Registered_Device_Not_Yet_Connect_Message_Label.bounds.size.width,
                                                                         self.Registered_Device_Not_Yet_Connect_Message_Label.bounds.size.height)
                                                 cornerRadius:registerViewSetting.Registered_Device_Message_Label_Corner_Radius];
    [Not_Yet_Register_Background_Shape_Layer setPath:Not_Yet_Register_Path1.CGPath];
    self.Registered_Device_Not_Yet_Connect_Message_Label.layer.mask = Not_Yet_Register_Background_Shape_Layer;
    
    //--------------------- Register More Than One Label -----------------------
    CAShapeLayer *Register_More_Than_One_Label_Background_Shape_Layer = [[CAShapeLayer alloc] init];
    
    UIBezierPath *Register_More_Than_One_Label_Path1 = [[UIBezierPath alloc] init];
    Register_More_Than_One_Label_Path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0,
                                                                         self.Registered_Device_Connect_More_Than_One_Message_Label.bounds.size.width,
                                                                         self.Registered_Device_Connect_More_Than_One_Message_Label.bounds.size.height)
                                                 cornerRadius:registerViewSetting.Registered_Device_Message_Label_Corner_Radius];
    [Register_More_Than_One_Label_Background_Shape_Layer setPath:Register_More_Than_One_Label_Path1.CGPath];
    self.Registered_Device_Connect_More_Than_One_Message_Label.layer.mask = Register_More_Than_One_Label_Background_Shape_Layer;
    
    //--------------------- Register Exactly One Label -----------------------
    CAShapeLayer *Register_Exactly_One_Label_Shape_Layer = [[CAShapeLayer alloc] init];
    
    UIBezierPath *Register_Exactly_One_Label_Path1 = [[UIBezierPath alloc] init];
    Register_Exactly_One_Label_Path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0,
                                                                         self.Registered_Device_Connect_Exactly_One_Message_Label.bounds.size.width,
                                                                         self.Registered_Device_Connect_Exactly_One_Message_Label.bounds.size.height)
                                                 cornerRadius:registerViewSetting.Registered_Device_Message_Label_Corner_Radius];
    [Register_Exactly_One_Label_Shape_Layer setPath:Register_Exactly_One_Label_Path1.CGPath];
    self.Registered_Device_Connect_Exactly_One_Message_Label.layer.mask = Register_Exactly_One_Label_Shape_Layer;
    
    
    //--------------------- Name Background View -----------------------
    CAShapeLayer *Name_Background_Shape_Layer = [[CAShapeLayer alloc] init];
    
    UIBezierPath *Name_Path1 = [[UIBezierPath alloc] init];
    Name_Path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0,
                                                                         self.Name_Background_View.bounds.size.width,
                                                                         self.Name_Background_View.bounds.size.height)
                                                 cornerRadius:registerViewSetting.TextField_Corner_Radius];
    [Name_Background_Shape_Layer setPath:Name_Path1.CGPath];
    self.Name_Background_View.layer.mask = Name_Background_Shape_Layer;
    
    //--------------------- Bed Number Background View -----------------------
    CAShapeLayer *Bed_Number_Background_Shape_Layer = [[CAShapeLayer alloc] init];
    
    UIBezierPath *Bed_Number_Path1 = [[UIBezierPath alloc] init];
    Bed_Number_Path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0,
                                                                         self.Bed_Number_Background_View.bounds.size.width,
                                                                         self.Bed_Number_Background_View.bounds.size.height)
                                                 cornerRadius:registerViewSetting.TextField_Corner_Radius];
    [Bed_Number_Background_Shape_Layer setPath:Bed_Number_Path1.CGPath];
    
    self.Bed_Number_Background_View.layer.mask = Bed_Number_Background_Shape_Layer;
}
@end
