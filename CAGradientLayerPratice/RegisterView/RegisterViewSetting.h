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
@property (assign, nonatomic) float Registered_Device_Message_Label_Width_Ratio;
@property (assign, nonatomic) float Registered_Device_Message_Label_Text_Size;
@property (assign, nonatomic) float Registered_Device_Message_Label_TextAlignment;

@property (assign, nonatomic) float Name_TextField_Top_Distance_Ratio;
@property (assign, nonatomic) float Bed_Number_TextField_Distance_Ratio;
@property (assign, nonatomic) float Register_Button_Distance_Ratio;
@property (assign, nonatomic) float Register_Button_Width_Ratio;

@end

NS_ASSUME_NONNULL_END
