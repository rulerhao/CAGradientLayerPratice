//
//  SensorLargeSizeViewSetting.h
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SensorLargeSizeViewSetting : NSObject

//--------------------- Background Card ImageView -----------------------
@property (assign, nonatomic) float Ratio_Card_To_Content;

//--------------------- Photo ImageView -----------------------
@property (assign, nonatomic) float Ratio_To_Origin;

@property (assign, nonatomic) float Photo_Width_Multi;
@property (assign, nonatomic) float Photo_Width_To_Height_Multi;

@property (assign, nonatomic) float Baby_Image_Elipstic_X;
@property (assign, nonatomic) float Baby_Image_Elipstic_Y;
@property (assign, nonatomic) float Baby_Image_Elipstic_Width;
@property (assign, nonatomic) float Baby_Image_Elipstic_Height;

@property (assign, nonatomic) float Baby_Image_Rect_X;
@property (assign, nonatomic) float Baby_Image_Rect_Y;
@property (assign, nonatomic) float Baby_Image_Rect_Width;
@property (assign, nonatomic) float Baby_Image_Rect_Height;

@property (assign, nonatomic) float Baby_Image_Rect_Height_Corner_Radius;

@property (assign, nonatomic) float Baby_Photo_X;
@property (assign, nonatomic) float Baby_Photo_Y;

//--------------------- Baby Name View -----------------------
@property (assign, nonatomic) float Baby_Name_Width;
@property (assign, nonatomic) float Baby_Name_Height;
@property (assign, nonatomic) float Baby_Name_X;
@property (assign, nonatomic) float Baby_Name_Y;
@property (assign, nonatomic) float Baby_Name_Corner_Radius;

//--------------------- Status Bar -----------------------
@property (assign, nonatomic) float Status_Left_Distance;

//--------------------- Breath Status ImageView -----------------------
@property (assign, nonatomic) float Breath_Status_Top_Distance;
@property (assign, nonatomic) float Breath_Status_Width;

//--------------------- Temperature Label -----------------------
@property (assign, nonatomic) float Temperature_Top_Distance;

//--------------------- Battery Label -----------------------
@property (assign, nonatomic) float Battery_ImageView_Top_Distance;
@property (assign, nonatomic) float Battery_ImageView_Width;
@property (assign, nonatomic) float Battery_ImageView_Height;

@end

NS_ASSUME_NONNULL_END
