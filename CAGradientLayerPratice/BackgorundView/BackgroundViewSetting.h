//
//  BackgroundViewSetting.h
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BackgroundViewSetting : NSObject

//--------------------- Background Gradient Layer -----------------------
@property (strong, nonatomic) NSArray *Log_In_Background_Gradient_Layer_Color;
@property (assign, nonatomic) CGPoint Log_In_Background_Gradient_Layer_Start_Point;
@property (assign, nonatomic) CGPoint Log_In_Background_Gradient_Layer_End_Point;

//--------------------- Log In Paint Image View -----------------------
@property (assign, nonatomic) CGSize Log_In_Paint_Image_Size;
@property (strong, nonatomic) UIImage *Log_In_Paint_Image;

@end

NS_ASSUME_NONNULL_END
