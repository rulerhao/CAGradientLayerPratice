//
//  LoginViewSetting.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/19.
//

#import "LoginViewSetting.h"
@interface LoginViewSetting ()


@end

@implementation LoginViewSetting

- (instancetype) init
{
    self = [super init];
    if (self) {
        NSLog(@"INTO INIT");
        UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
        
        CGSize Whole_View_Size = CGSizeMake(window.screen.bounds.size.width, window.screen.bounds.size.height);
        CGSize Safe_View_Size = CGSizeMake(window.safeAreaLayoutGuide.layoutFrame.size.width, window.safeAreaLayoutGuide.layoutFrame.size.height);
        
        // Word Multi
        float Word_Size_Multi = Safe_View_Size.width / 428;
        
        //--------------------- Log In Title Label -----------------------
        self.Log_In_Title_Label_Top_Distance = Safe_View_Size.height / 5;
        self.Log_In_Title_Label_Text = @"LOG IN";
        self.Log_In_Title_Label_Text_Color = [UIColor whiteColor];
        self.Log_In_Title_Label_Text_Font = [UIFont fontWithName:@"American Typewriter Bold" size:30 * Word_Size_Multi];
        
        //--------------------- Log In Description Label -----------------------
        self.Log_In_Description_Label_Text = @"TO CONTINUE";
        self.Log_In_Description_Label_Text_Color = [UIColor whiteColor];
        self.Log_In_Description_Label_Text_Font = [UIFont fontWithName:@"American Typewriter" size:25 * Word_Size_Multi];
        
        //--------------------- Log In Account Title Label -----------------------
        self.Log_In_Account_Title_Text = @"Account";
        self.Log_In_Account_Title_Text_Color = [UIColor whiteColor];
        self.Log_In_Account_Title_Text_Font = [UIFont fontWithName:@"American Typewriter" size:12 * Word_Size_Multi];
        
        //--------------------- Log In Account Content TextField -----------------------
        self.Log_In_Account_Content_Text = @"kjump";
        self.Log_In_Account_Content_Text_Color = [UIColor whiteColor];
        self.Log_In_Account_Content_Text_Font = [UIFont fontWithName:@"American Typewriter" size:12 * Word_Size_Multi];
        
        //--------------------- Log In Account Buttom Line Layer -----------------------
        self.Log_In_Account_Bottom_View_Layer_Width_Multi = 0.7;
        
        //--------------------- Log In Password Title Label -----------------------
        self.Log_In_Password_Title_Text = @"Password";
        self.Log_In_Password_Title_Text_Color = [UIColor whiteColor];
        self.Log_In_Password_Title_Text_Font = [UIFont fontWithName:@"American Typewriter" size:12 * Word_Size_Multi];
        
        //--------------------- Log In Password Content TextField -----------------------
        self.Log_In_Password_Content_Text = @"1234qwer";
        self.Log_In_Password_Content_Text_Color = [UIColor whiteColor];
        self.Log_In_Password_Content_Text_Font = [UIFont fontWithName:@"American Typewriter" size:12 * Word_Size_Multi];
        
        //--------------------- Log In Password Buttom Line Layer -----------------------
        self.Log_In_Password_Bottom_View_Layer_Width_Multi = 0.7;
        
        //--------------------- Log In botton -----------------------
        self.Log_In_Botton_Width_Multi = 0.2;
        self.Log_In_Botton_Height_Multi = 0.1;
        self.Log_In_Botton_Text_Font = [UIFont fontWithName:@"American Typewriter" size:12 * Word_Size_Multi];
        self.Log_In_Botton_Font_Color = [UIColor colorWithRed:40.0f/255.0f green:165.0f/255.0f blue:107.0f/255.0f alpha:1.0f];
    }
    return self;
}

- (void) updateConstraints {
    
}
@end
