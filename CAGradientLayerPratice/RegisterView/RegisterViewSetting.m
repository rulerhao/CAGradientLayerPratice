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
        
        NSLog(@"Whole_View_Size.height = %f", self.Whole_View_Size.height);
        
        self.Registered_Device_Message_Top_Distance_Ratio = 5.0 / 82.0;
        self.Registered_Device_Message_Label_And_TextFiled_Width_Ratio = 0.8;
        self.Registered_Device_Message_Label_Corner_Radius = 15.0 * self.Whole_View_Size.height / 844.0;
        
        float Registered_Device_Message_Label_Text_Size = self.Safe_View_Size.width / 10.0;
        
        NSInteger Registered_Device_Message_Label_TextAlignment = NSTextAlignmentCenter;
        
        self.Name_TextField_Top_Distance_Ratio = 33.0 / 82.0;
        self.Name_View_Bottom_Position_Percentage = 33.0 / 82.0;
        self.Bed_Number_View_Bottom_Position_Percentage = 44.0 / 82.0;
        
        self.Bed_Number_TextField_Distance_Ratio = 44.0 / 82.0;
        self.Register_Button_Distance_Ratio = 58.0 / 82.0;
        self.Register_Button_Width_Ratio = 0.6;
        
        self.Registered_Device_Not_Yet_Connect_Message_Label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.Registered_Device_Not_Yet_Connect_Message_Label.text = @"未連接\n未註冊裝置";
        self.Registered_Device_Not_Yet_Connect_Message_Label.lineBreakMode = NSLineBreakByWordWrapping;
        self.Registered_Device_Not_Yet_Connect_Message_Label.numberOfLines = 0;
        self.Registered_Device_Not_Yet_Connect_Message_Label.backgroundColor = [UIColor whiteColor];
        self.Registered_Device_Not_Yet_Connect_Message_Label.textColor = [UIColor greenColor];
        self.Registered_Device_Not_Yet_Connect_Message_Label.font = [UIFont fontWithName:@"Helvetica" size:Registered_Device_Message_Label_Text_Size];
        self.Registered_Device_Not_Yet_Connect_Message_Label.textAlignment = Registered_Device_Message_Label_TextAlignment;
        
        self.Registered_Device_Connect_More_Than_One_Message_Label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.Registered_Device_Connect_More_Than_One_Message_Label.text = @"連接超過一個\n未註冊裝置\n請同時間最多連接\n一個未註冊裝置";
        self.Registered_Device_Connect_More_Than_One_Message_Label.lineBreakMode = NSLineBreakByWordWrapping;
        self.Registered_Device_Connect_More_Than_One_Message_Label.numberOfLines = 0;
        self.Registered_Device_Connect_More_Than_One_Message_Label.backgroundColor = [UIColor whiteColor];
        self.Registered_Device_Connect_More_Than_One_Message_Label.textColor = [UIColor greenColor];
        self.Registered_Device_Connect_More_Than_One_Message_Label.font = [UIFont fontWithName:@"Helvetica" size:Registered_Device_Message_Label_Text_Size];
        self.Registered_Device_Connect_More_Than_One_Message_Label.textAlignment = Registered_Device_Message_Label_TextAlignment;
        
        self.Registered_Device_Connect_Exactly_One_Message_Label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.Registered_Device_Connect_Exactly_One_Message_Label.text = @"已連接\n未註冊裝置";
        self.Registered_Device_Connect_Exactly_One_Message_Label.lineBreakMode = NSLineBreakByWordWrapping;
        self.Registered_Device_Connect_Exactly_One_Message_Label.numberOfLines = 0;
        self.Registered_Device_Connect_Exactly_One_Message_Label.backgroundColor = [UIColor whiteColor];
        self.Registered_Device_Connect_Exactly_One_Message_Label.textColor = [UIColor greenColor];
        self.Registered_Device_Connect_Exactly_One_Message_Label.font = [UIFont fontWithName:@"Helvetica" size:Registered_Device_Message_Label_Text_Size];
        self.Registered_Device_Connect_Exactly_One_Message_Label.textAlignment = Registered_Device_Message_Label_TextAlignment;
        
        self.TextField_Height_Percentage = 0.07;
        self.TextField_Corner_Radius = 30.0 * self.Whole_View_Size.height / 844.0;
        // ------------- Name View ---------------
        UIColor *Title_Color = [UIColor greenColor];
        UIColor *TextField_Background = [UIColor whiteColor];
        
        float Font_Size = 30.0 * self.Whole_View_Size.height / 844.0;
        
        self.Name_Title_Label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.Name_Title_Label.text = @"姓名";
        self.Name_Title_Label.textColor = Title_Color;
        self.Name_Title_Label.textAlignment = NSTextAlignmentLeft;
        self.Name_Title_Label.font = [UIFont fontWithName:@"Helvetica" size:Font_Size];
        
        self.Name_TextField = [[UITextField alloc] initWithFrame:CGRectZero];
        self.Name_TextField.textAlignment = NSTextAlignmentRight;
        self.Name_TextField.font = [UIFont fontWithName:@"Helvetica" size:Font_Size];
        self.Name_TextField.text = @"DEF";
        
        self.Name_Background_View = [[UIView alloc] initWithFrame:CGRectZero];
        self.Name_Background_View.backgroundColor = TextField_Background;
        
        // ------------- Bed Number View ---------------
        self.Bed_Number_Title_Label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.Bed_Number_Title_Label.text = @"床號";
        self.Bed_Number_Title_Label.textColor = Title_Color;
        self.Bed_Number_Title_Label.textAlignment = NSTextAlignmentLeft;
        self.Bed_Number_Title_Label.font = [UIFont fontWithName:@"Helvetica" size:Font_Size];
        
        self.Bed_Number_TextField = [[UITextField alloc] initWithFrame:CGRectZero];
        self.Bed_Number_TextField.textAlignment = NSTextAlignmentRight;
        self.Bed_Number_TextField.font = [UIFont fontWithName:@"Helvetica" size:Font_Size];
        self.Bed_Number_TextField.text = @"ABC";
        
        self.Bed_Number_Background_View = [[UIView alloc] initWithFrame:CGRectZero];
        self.Bed_Number_Background_View.backgroundColor = TextField_Background;
        
        // ------------- Register Button View ---------------
        self.Register_Button = [[UIButton alloc] initWithFrame:CGRectZero];
        [self.Register_Button setImage:[UIImage imageNamed:@"MUL OUcare_13 button3.png"] forState:UIControlStateNormal];
        
        self.Register_Button_Text_Label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.Register_Button_Text_Label.text = @"註冊";
        self.Register_Button_Text_Label.font = [UIFont fontWithName:@"Helvetica" size:Font_Size];
        self.Register_Button_Text_Label.textColor = [UIColor whiteColor];
        self.Register_Button_Text_Label.textAlignment = NSTextAlignmentCenter;
        
        
    }
    return self;
}
@end
