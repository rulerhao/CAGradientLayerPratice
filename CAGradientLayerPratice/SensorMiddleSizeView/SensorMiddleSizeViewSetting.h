//
//  SensorMiddleSizeViewSetting.h
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SensorMiddleSizeViewSetting : NSObject

@property (assign, nonatomic) float CollectionView_Width_Ratio;

@property (assign, nonatomic) float CollectionView_Vertical_Distance;
@property (assign, nonatomic) float CollectionView_Horizental_Distance;

@property (assign, nonatomic) float Cell_Width;
@property (assign, nonatomic) float Cell_Height;
@property (assign, nonatomic) float Cell_Corner_Radius;

@property (assign, nonatomic) float CollectionView_Width;
@property (assign, nonatomic) float CollectionView_Height;

@property (strong, nonatomic) NSMutableArray *Cell_Background_Gradient_Color;
@property (strong, nonatomic) NSMutableArray *Cell_Background_White_Gradient_Color;
@property (strong, nonatomic) NSMutableArray *Cell_Background_Red_Gradient_Color;
@property (assign, nonatomic) CGPoint Cell_Background_Gradient_Start_Point;
@property (assign, nonatomic) CGPoint Cell_Background_Gradient_End_Point;

@property (assign, nonatomic) CGRect Baby_Photo_Rect_Rect;
@property (assign, nonatomic) CGRect Baby_Photo_Elipstic_Rect;
@property (assign, nonatomic) float Baby_Photo_Rect_Corner_Radious;

//--------------------- Name Label -----------------------
@property (assign, nonatomic) CGRect Name_Label_Rect;
@property (assign, nonatomic) float Name_Label_Corner_Radius;
@property (strong, nonatomic) UIColor *Name_Label_Background_Color;
@property (nonatomic) NSTextAlignment Name_Label_TextAlignment;

//--------------------- Battery Volume ImageView -----------------------
@property (assign, nonatomic) CGRect Battery_ImageView_Rect;
@property (assign, nonatomic) float Battery_ImageView_Photo_Distance;
@property (strong, nonatomic) UIImage *Battery_ImageView_Photo_Image;

//--------------------- Bed Nubmer Label -----------------------
@property (assign, nonatomic) float Bed_Number_Label_Top_Distance;
@property (assign, nonatomic) float Bed_Number_Label_Text_Size;
@property (nonatomic) NSTextAlignment Bed_Number_TextAlignment;

//--------------------- Breath Status ImageView -----------------------
@property (strong, nonatomic) UIImage *Breath_Status_Image;
@property (assign, nonatomic) CGRect Breath_Status_ImageView_Rect;
@property (assign, nonatomic) float Breath_Status_Top_Distance;

//--------------------- Temperature Label -----------------------
@property (assign, nonatomic) CGRect Temperature_Label_Rect;
@property (assign, nonatomic) float Temperature_Label_Top_Distance;
@property (assign, nonatomic) float Temperature_Label_Text_Size;
@end

NS_ASSUME_NONNULL_END
