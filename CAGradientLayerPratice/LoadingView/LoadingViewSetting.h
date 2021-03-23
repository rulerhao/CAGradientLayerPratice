//
//  LoadingViewSetting.h
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/22.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface LoadingViewSetting : NSObject

//--------------------- Loading Background Top View -----------------------
@property (strong, nonatomic) UIImage *Loading_Background_Top_Image;
@property (assign, nonatomic) float Loading_Background_Top_Image_Height_Scale;
@property (assign, nonatomic) float Loading_Background_Top_Image_Width_Scale;

//--------------------- Loading Background Bottom View -----------------------
@property (strong, nonatomic) UIImage *Loading_Background_Bottom_Image;
@property (assign, nonatomic) float Loading_Background_Bottom_Image_Height_Scale;
@property (assign, nonatomic) float Loading_Background_Bottom_Image_Width_Scale;

//--------------------- Loading Title View -----------------------
@property (strong, nonatomic) UIImage *Loading_Title_Image;
@property (assign, nonatomic) float Loading_Title_Image_Height_Scale;
@property (assign, nonatomic) float Loading_Title_Image_Width_Scale;


@end

NS_ASSUME_NONNULL_END
