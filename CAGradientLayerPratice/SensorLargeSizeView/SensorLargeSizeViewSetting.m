//
//  SensorLargeSizeViewSetting.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/23.
//

#import "SensorLargeSizeViewSetting.h"
@interface SensorLargeSizeViewSetting ()

@property (assign, nonatomic) float Origin_Card_Image_Width;
@property (assign, nonatomic) float Origin_Card_Image_Height;
@property (assign, nonatomic) float Origin_Card_Distance;

@property (assign, nonatomic) float Origin_Baby_Image_Width;
@property (assign, nonatomic) float Origin_Baby_Image_height;
@property (assign, nonatomic) float Origin_Baby_Image_Middle_Point_X;
@property (assign, nonatomic) float Origin_Baby_Image_Middle_Point_Y;
@property (assign, nonatomic) float Origin_Baby_Image_X;
@property (assign, nonatomic) float Origin_Baby_Image_Y;

@property (assign, nonatomic) float Origin_Elipstic_Image_Width;
@property (assign, nonatomic) float Origin_Elipstic_Image_Height;
@property (assign, nonatomic) float Origin_Elipstic_Image_Middle_Point_X;
@property (assign, nonatomic) float Origin_Elipstic_Image_Middle_Point_Y;
@property (assign, nonatomic) float Origin_Elipstic_Image_X;
@property (assign, nonatomic) float Origin_Elipstic_Image_Y;

@property (assign, nonatomic) float Origin_Side_Width_Diff;
@property (assign, nonatomic) float Origin_Y_Diff;

@end
@implementation SensorLargeSizeViewSetting
- (instancetype) init {
    self = [super init];
    if (self) {
        
        UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
        
        CGSize Whole_View_Size = CGSizeMake(window.screen.bounds.size.width, window.screen.bounds.size.height);
        CGSize Safe_View_Size = CGSizeMake(window.safeAreaLayoutGuide.layoutFrame.size.width, window.safeAreaLayoutGuide.layoutFrame.size.height);
        
        self.Ratio_To_Origin = Whole_View_Size.width / (133.0 * 100.0 / 92.0);

        //--------------------- Background Card ImageView -----------------------
        self.Origin_Card_Image_Width = 133.0;
        self.Origin_Card_Image_Height = 215.0;
        self.Origin_Card_Distance = 3.0;
        
        self.Ratio_Card_To_Content = 0.92;
        //--------------------- Photo ImageView -----------------------
        
        self.Origin_Baby_Image_Width = 127.0;
        self.Origin_Baby_Image_height = 209.0;
        self.Origin_Baby_Image_Middle_Point_X = 0;
        self.Origin_Baby_Image_Middle_Point_Y = 1099.66 - 1013.377;
        self.Origin_Baby_Image_X = self.Origin_Baby_Image_Middle_Point_X - self.Origin_Baby_Image_Width / 2;
        self.Origin_Baby_Image_Y = self.Origin_Baby_Image_Middle_Point_Y - self.Origin_Baby_Image_height / 2;
        
        float Origin_Photo_Height = 110.0;
        
        self.Photo_Width_Multi = self.Origin_Baby_Image_Width / self.Origin_Card_Image_Width;
        self.Photo_Width_To_Height_Multi = Origin_Photo_Height / self.Origin_Baby_Image_Width;
        
        self.Origin_Elipstic_Image_Width = 241.6;
        self.Origin_Elipstic_Image_Height = 183.0;
        self.Origin_Elipstic_Image_Middle_Point_X = 0;
        self.Origin_Elipstic_Image_Middle_Point_Y = 0;
        self.Origin_Elipstic_Image_X = self.Origin_Elipstic_Image_Middle_Point_X - self.Origin_Elipstic_Image_Width / 2;
        self.Origin_Elipstic_Image_Y = self.Origin_Elipstic_Image_Middle_Point_Y - self.Origin_Elipstic_Image_Height / 2;
        
        self.Origin_Side_Width_Diff = fabsf((self.Origin_Elipstic_Image_Width - self.Origin_Baby_Image_Width) / 2);
        self.Origin_Y_Diff = fabsf(self.Origin_Elipstic_Image_Y - self.Origin_Baby_Image_Y);
        
        //--------------------- Baby Photo ImageView -----------------------
        self.Baby_Image_Elipstic_X = - self.Origin_Side_Width_Diff * self.Ratio_To_Origin + self.Origin_Card_Distance * self.Ratio_To_Origin;
        self.Baby_Image_Elipstic_Y = - self.Origin_Y_Diff * self.Ratio_To_Origin + self.Origin_Card_Distance * self.Ratio_To_Origin;
        
        self.Baby_Image_Elipstic_Width = self.Origin_Elipstic_Image_Width * self.Ratio_To_Origin;
        self.Baby_Image_Elipstic_Height = self.Origin_Elipstic_Image_Height * self.Ratio_To_Origin;
        
        self.Baby_Image_Rect_X = self.Origin_Card_Distance * self.Ratio_To_Origin;
        self.Baby_Image_Rect_Y = self.Origin_Card_Distance * self.Ratio_To_Origin;;
        
        self.Baby_Image_Rect_Width = self.Origin_Baby_Image_Width * self.Ratio_To_Origin + 1;
        self.Baby_Image_Rect_Height = self.Origin_Baby_Image_height * self.Ratio_To_Origin;
        
        self.Baby_Image_Rect_Height_Corner_Radius = 14.0 * self.Ratio_To_Origin;
        
        self.Baby_Photo_X = 0;
        self.Baby_Photo_Y = 0;
        //--------------------- Baby Name View -----------------------
        float Origin_Baby_Name_Width = 60.0;
        float Origin_Baby_Name_Height = 20.0;
        float Origin_Baby_Name_Corner_Radius = 10.0;
        
        self.Baby_Name_Width = Origin_Baby_Name_Width * self.Ratio_To_Origin;
        self.Baby_Name_Height = Origin_Baby_Name_Height * self.Ratio_To_Origin;
        self.Baby_Name_X = 0;
        self.Baby_Name_Y = 0;
        self.Baby_Name_Corner_Radius = Origin_Baby_Name_Corner_Radius * self.Ratio_To_Origin;
        
        //--------------------- Breath Status ImageView -----------------------
        float Origin_Breath_Status_Left_Distance = 58.5;
        float Origin_Breath_Status_To_Photo_Distance = 13.5;
        float Origin_Breath_Status_Width = 18.0;
        self.Status_Left_Distance = Origin_Breath_Status_Left_Distance * self.Ratio_To_Origin;
        self.Breath_Status_Top_Distance = Origin_Breath_Status_To_Photo_Distance * self.Ratio_To_Origin;
        self.Breath_Status_Width = Origin_Breath_Status_Width * self.Ratio_To_Origin;
        
        //--------------------- Breath Status ImageView -----------------------
        float Origin_Temperature_Label_Top_Distance = 13.5 + 33;
        self.Temperature_Top_Distance = Origin_Temperature_Label_Top_Distance * self.Ratio_To_Origin;
        
        //--------------------- Sensor Battery Volume Label -----------------------
        float Origin_Battery_ImageView_Top_Distance = 13.5 + 33 + 33;
        float Origin_Battery_ImageView_Width = 28.0;
        float Origin_Battery_ImageView_Height = 15.0;
        self.Battery_ImageView_Top_Distance = Origin_Battery_ImageView_Top_Distance * self.Ratio_To_Origin;
        self.Battery_ImageView_Width = Origin_Battery_ImageView_Width * self.Ratio_To_Origin;
        self.Battery_ImageView_Height = Origin_Battery_ImageView_Height * self.Ratio_To_Origin;
    }
    return self;
}
@end
