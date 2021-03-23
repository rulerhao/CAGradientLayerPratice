//
//  LoginViewSetting.h
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewSetting : NSObject

//--------------------- Log In Title Label -----------------------
@property (assign, nonatomic) float Log_In_Title_Label_Top_Distance;
@property (strong, nonatomic) NSString *Log_In_Title_Label_Text;
@property (strong, nonatomic) UIColor *Log_In_Title_Label_Text_Color;
@property (strong, nonatomic) UIFont *Log_In_Title_Label_Text_Font;

//--------------------- Log In Description Label -----------------------
@property (strong, nonatomic) NSString *Log_In_Description_Label_Text;
@property (strong, nonatomic) UIColor *Log_In_Description_Label_Text_Color;
@property (strong, nonatomic) UIFont *Log_In_Description_Label_Text_Font;

//--------------------- Log In Account Title Label -----------------------
@property (strong, nonatomic) NSString *Log_In_Account_Title_Text;
@property (strong, nonatomic) UIColor *Log_In_Account_Title_Text_Color;
@property (strong, nonatomic) UIFont *Log_In_Account_Title_Text_Font;

//--------------------- Log In Account Content TextField -----------------------
@property (strong, nonatomic) NSString *Log_In_Account_Content_Text;
@property (strong, nonatomic) UIColor *Log_In_Account_Content_Text_Color;
@property (strong, nonatomic) UIFont *Log_In_Account_Content_Text_Font;

//--------------------- Log In Account Bottom View -----------------------
@property (assign, nonatomic) float Log_In_Account_Bottom_View_Layer_Width_Multi;

//--------------------- Log In Password Title Label -----------------------
@property (strong, nonatomic) NSString *Log_In_Password_Title_Text;
@property (strong, nonatomic) UIColor *Log_In_Password_Title_Text_Color;
@property (strong, nonatomic) UIFont *Log_In_Password_Title_Text_Font;

//--------------------- Log In Password Content TextField -----------------------
@property (strong, nonatomic) NSString *Log_In_Password_Content_Text;
@property (strong, nonatomic) UIColor *Log_In_Password_Content_Text_Color;
@property (strong, nonatomic) UIFont *Log_In_Password_Content_Text_Font;

//--------------------- Log In Password Bottom View -----------------------
@property (assign, nonatomic) float Log_In_Password_Bottom_View_Layer_Width_Multi;

//--------------------- Log In botton -----------------------
@property (assign, nonatomic) float Log_In_Botton_Width_Multi;
@property (assign, nonatomic) float Log_In_Botton_Height_Multi;
@property (strong, nonatomic) UIFont *Log_In_Botton_Text_Font;
@property (strong, nonatomic) UIColor *Log_In_Botton_Font_Color;

@end

NS_ASSUME_NONNULL_END
