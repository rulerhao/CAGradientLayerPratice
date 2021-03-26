//
//  SensorMiddleSizeViewSetting.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/25.
//

#import "SensorMiddleSizeViewSetting.h"
@interface SensorMiddleSizeViewSetting ()
{
    
}
@property (assign, nonatomic) CGSize Whole_View_Size;
@property (assign, nonatomic) CGSize Safe_View_Size;
@end
@implementation SensorMiddleSizeViewSetting
- (instancetype)init
{
    self = [super init];
    if (self) {
        UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
        
        self.Whole_View_Size = CGSizeMake(window.screen.bounds.size.width, window.screen.bounds.size.height);
        self.Safe_View_Size = CGSizeMake(window.safeAreaLayoutGuide.layoutFrame.size.width, window.safeAreaLayoutGuide.layoutFrame.size.height);
        
        float Ratio_Per_PX;
        self.CollectionView_Width_Ratio = 0.92;
        
        float Origin_CollectionView_Vertical_Distance = 7.2;
        float Origin_CollectionView_Horizental_Distance = 7.2;
        
        float Origin_Cell_Width = 63.0;
        float Origin_Cell_Height = 99.0;
        float Origin_Cell_Corner_Radius = 12.0;
        
        Ratio_Per_PX = self.Safe_View_Size.width * self.CollectionView_Width_Ratio / (Origin_Cell_Width * 2 + Origin_CollectionView_Horizental_Distance);
        
        self.CollectionView_Vertical_Distance = Origin_CollectionView_Vertical_Distance * Ratio_Per_PX;
        self.CollectionView_Horizental_Distance = Origin_CollectionView_Horizental_Distance * Ratio_Per_PX;
        
        self.Cell_Width = Origin_Cell_Width * Ratio_Per_PX;
        self.Cell_Height = Origin_Cell_Height * Ratio_Per_PX;
        self.Cell_Corner_Radius = Origin_Cell_Corner_Radius * Ratio_Per_PX;
        
        // CollectionView Size
        float Origin_CollectionView_Width = Origin_Cell_Width * 2 + Origin_CollectionView_Horizental_Distance;
        float Origin_CollectionView_Height = Origin_Cell_Height * 2 + Origin_CollectionView_Vertical_Distance;
        
        self.CollectionView_Width = Origin_CollectionView_Width * Ratio_Per_PX;
        self.CollectionView_Height = Origin_CollectionView_Height * Ratio_Per_PX;
        
        //--------------------- Log In Background Gradient Layer -----------------------
        self.Cell_Background_Gradient_Color = [[NSMutableArray alloc] initWithArray:@[
            (id)[UIColor colorWithRed:255.0/255.0 green:10.0/255.0 blue:108.0/255.0 alpha:1.0].CGColor,
            (id)[UIColor colorWithRed:255.0/255.0 green:37.0/255.0 blue:37.0/255.0 alpha:1.0].CGColor]];
        self.Cell_Background_Gradient_Start_Point = CGPointMake(0.0, sqrt(3));
        self.Cell_Background_Gradient_End_Point = CGPointMake(1.0, 0);
        
        //--------------------- Baby Photo ImageView -----------------------
        CGRect Origin_Baby_Photo_Rect_Rect = CGRectMake(0, 0, 63.0, 99.0);
        float Origin_Baby_Photo_Rect_Corner_Radious = 12.0;
        
        CGRect Origin_Baby_Photo_Elipstic_Rect = CGRectMake(0, 1146.587 - 1083.431, 115.0, 98.0);
        
        self.Baby_Photo_Rect_Rect = CGRectMake(0, 0,
                                               Origin_Baby_Photo_Rect_Rect.size.width * Ratio_Per_PX,
                                               (2 * Origin_Baby_Photo_Rect_Rect.size.height / 2 - Origin_Baby_Photo_Elipstic_Rect.origin.y) * Ratio_Per_PX);
        self.Baby_Photo_Elipstic_Rect = CGRectMake( - (1.0 / 2.0) * fabs(Origin_Baby_Photo_Rect_Rect.size.width - Origin_Baby_Photo_Elipstic_Rect.size.width) * Ratio_Per_PX, 0, Origin_Baby_Photo_Elipstic_Rect.size.width * Ratio_Per_PX, Origin_Baby_Photo_Elipstic_Rect.size.height * Ratio_Per_PX);
        self.Baby_Photo_Rect_Corner_Radious = Origin_Baby_Photo_Rect_Corner_Radious * Ratio_Per_PX;
        
    }
    return self;
}
@end
