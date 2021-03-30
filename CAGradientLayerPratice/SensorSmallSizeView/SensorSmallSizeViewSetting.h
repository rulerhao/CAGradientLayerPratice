//
//  SensorSmallSizeViewSetting.h
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SensorSmallSizeViewSetting : NSObject

typedef NS_ENUM(NSInteger, CollectionViewCellViewEnum) {
    ViewHaveNotThing = -1,
    BackgroundViewTag = 1,
    BedNumberLabelTag = 2
};

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

//--------------------- Bed Nubmer Label -----------------------
@property (assign, nonatomic) float Bed_Number_Label_Text_Size;
@property (nonatomic) NSTextAlignment Bed_Number_TextAlignment;

@end

NS_ASSUME_NONNULL_END
