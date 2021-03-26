//
//  RegisterViewSetting.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/26.
//

#import "RegisterViewSetting.h"
@interface RegisterViewSetting ()
{
    
}
@property (assign, nonatomic) CGSize Whole_View_Size;
@property (assign, nonatomic) CGSize Safe_View_Size;

@end
@implementation RegisterViewSetting
- (instancetype)init
{
    self = [super init];
    if (self) {
        UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
        
        self.Whole_View_Size = CGSizeMake(window.screen.bounds.size.width, window.screen.bounds.size.height);
        self.Safe_View_Size = CGSizeMake(window.safeAreaLayoutGuide.layoutFrame.size.width, window.safeAreaLayoutGuide.layoutFrame.size.height);
        
        self.Registered_Device_Message_Top_Distance_Ratio = 5.0 / 82.0;
        self.Registered_Device_Message_Label_Width_Ratio = 0.8;
        self.Registered_Device_Message_Label_Text_Size = self.Safe_View_Size.width / 10.0;
        self.Registered_Device_Message_Label_TextAlignment = NSTextAlignmentCenter;
        
        self.Name_TextField_Top_Distance_Ratio = 33.0 / 82.0;
        self.Bed_Number_TextField_Distance_Ratio = 44.0 / 82.0;
        self.Register_Button_Distance_Ratio = 58.0 / 82.0;
        self.Register_Button_Width_Ratio = 0.6;
    }
    return self;
}
@end
