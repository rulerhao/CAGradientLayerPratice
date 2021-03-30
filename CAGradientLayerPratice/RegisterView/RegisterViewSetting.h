//
//  RegisterViewSetting.h
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewSetting : NSObject

@property (assign, nonatomic) float Registered_Device_Message_Top_Distance_Ratio;
@property (assign, nonatomic) float Registered_Device_Message_Label_And_TextFiled_Width_Ratio;
@property (assign, nonatomic) float Registered_Device_Message_Label_Corner_Radius;

@property (assign, nonatomic) float Name_TextField_Top_Distance_Ratio;
@property (assign, nonatomic) float Bed_Number_TextField_Distance_Ratio;
@property (assign, nonatomic) float Register_Button_Distance_Ratio;
@property (assign, nonatomic) float Register_Button_Width_Ratio;

@property (strong, nonatomic) UILabel *Registered_Device_Not_Yet_Connect_Message_Label;
@property (strong, nonatomic) UILabel *Registered_Device_Connect_More_Than_One_Message_Label;
@property (strong, nonatomic) UILabel *Registered_Device_Connect_Exactly_One_Message_Label;

@property (assign, nonatomic) float TextField_Height_Percentage;
@property (assign, nonatomic) float TextField_Corner_Radius;

@property (assign, nonatomic) float Name_View_Bottom_Position_Percentage;
@property (assign, nonatomic) float Bed_Number_View_Bottom_Position_Percentage;

@property (strong, nonatomic) UIView *Name_Background_View;
@property (strong, nonatomic) UILabel *Name_Title_Label;
@property (strong, nonatomic) UITextField *Name_TextField;

@property (strong, nonatomic) UIView *Bed_Number_Background_View;
@property (strong, nonatomic) UILabel *Bed_Number_Title_Label;
@property (strong, nonatomic) UITextField *Bed_Number_TextField;

@property (strong, nonatomic) UIButton *Register_Button;
@property (strong, nonatomic) UILabel *Register_Button_Text_Label;


@end

NS_ASSUME_NONNULL_END
