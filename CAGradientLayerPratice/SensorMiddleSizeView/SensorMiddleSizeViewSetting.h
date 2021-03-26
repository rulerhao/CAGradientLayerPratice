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
@property (assign, nonatomic) CGPoint Cell_Background_Gradient_Start_Point;
@property (assign, nonatomic) CGPoint Cell_Background_Gradient_End_Point;

@property (assign, nonatomic) CGRect Baby_Photo_Rect_Rect;
@property (assign, nonatomic) CGRect Baby_Photo_Elipstic_Rect;
@property (assign, nonatomic) float Baby_Photo_Rect_Corner_Radious;

@end

NS_ASSUME_NONNULL_END
