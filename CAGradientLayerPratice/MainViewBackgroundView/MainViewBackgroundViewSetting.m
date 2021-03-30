//
//  MainViewBackgroundViewSetting.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/29.
//

#import "MainViewBackgroundViewSetting.h"

@implementation MainViewBackgroundViewSetting
- (instancetype)init
{
    self = [super init];
    if (self) {
        float Height_Percentage_For_This_Controller_To_Phone_Heigth = 0.82;
        
        float Origin_OUCare_Icon_Width_Percentage_For_Phone_Width = 0.3;
        float Origin_OUCare_Icon_Top_Percentage_For_Phone_Bottom_Bounds = 0.03;
        self.OUCare_Icon_Image = [UIImage imageNamed:@"MUL OUcare_05 OUcare logo 50%.png"];
        self.OUCare_Icon_Width_Percentage_For_This_Controller = Origin_OUCare_Icon_Width_Percentage_For_Phone_Width * Height_Percentage_For_This_Controller_To_Phone_Heigth;
        self.OUCare_Icon_Top_Percentage_For_This_Controller_Bottom = 1 - Origin_OUCare_Icon_Top_Percentage_For_Phone_Bottom_Bounds;
        
        self.OUCare_Main_View_Background_Color = [UIColor colorWithRed:211.0/255.0 green:236.0/255.0 blue:211.0/255.0 alpha:1.0];
        
    }
    return self;
}

@end
