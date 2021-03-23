//
//  BackgroundViewSetting.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/22.
//

#import "BackgroundViewSetting.h"

@implementation BackgroundViewSetting
- (instancetype) init
{
    self = [super init];
    if (self) {
        NSLog(@"INTO INIT");
        UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
        
        CGSize Whole_View_Size = CGSizeMake(window.screen.bounds.size.width, window.screen.bounds.size.height);
        CGSize Safe_View_Size = CGSizeMake(window.safeAreaLayoutGuide.layoutFrame.size.width, window.safeAreaLayoutGuide.layoutFrame.size.height);
        
        //--------------------- Log In Background Gradient Layer -----------------------
        self.Log_In_Background_Gradient_Layer_Color = [[NSMutableArray alloc] initWithArray:@[
            (id)[UIColor colorWithRed:88.0f/255.0f green:180.0f/255.0f blue:75.0f/255.0f alpha:1.0f].CGColor,
            (id)[UIColor colorWithRed:40.0f/255.0f green:165.0f/255.0f blue:107.0f/255.0f alpha:1.0f].CGColor]];
        self.Log_In_Background_Gradient_Layer_Start_Point = CGPointMake(0.0, sqrt(3));
        self.Log_In_Background_Gradient_Layer_End_Point = CGPointMake(1.0, 0);
        
        
        //--------------------- Login Paint Image View -----------------------
        self.Log_In_Paint_Image = [UIImage alloc];
        self.Log_In_Paint_Image = [UIImage imageNamed:@"MUL OUcare_04 login paint.png"];
        self.Log_In_Paint_Image_Size = CGSizeMake(Whole_View_Size.width, self.Log_In_Paint_Image.size.height * (Whole_View_Size.width / self.Log_In_Paint_Image.size.width));
    }
    return self;
}
@end
