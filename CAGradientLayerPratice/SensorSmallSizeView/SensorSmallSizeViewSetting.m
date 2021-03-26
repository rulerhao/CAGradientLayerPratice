
#import "SensorSmallSizeViewSetting.h"
@interface SensorSmallSizeViewSetting ()
{
    
}
@property (assign, nonatomic) CGSize Whole_View_Size;
@property (assign, nonatomic) CGSize Safe_View_Size;
@end
@implementation SensorSmallSizeViewSetting

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
        
        self.Whole_View_Size = CGSizeMake(window.screen.bounds.size.width, window.screen.bounds.size.height);
        self.Safe_View_Size = CGSizeMake(window.safeAreaLayoutGuide.layoutFrame.size.width, window.safeAreaLayoutGuide.layoutFrame.size.height);
        
        float Ratio_Per_PX;
        self.CollectionView_Width_Ratio = 0.94;
        
        float Origin_CollectionView_Vertical_Distance = 3.6;
        float Origin_CollectionView_Horizental_Distance = 3.6;
        
        float Origin_Cell_Width = 31.0;
        float Origin_Cell_Height = 38.5;
        float Origin_Cell_Corner_Radius = 11.0;
        
        Ratio_Per_PX = self.Safe_View_Size.width * self.CollectionView_Width_Ratio / (Origin_Cell_Width * 4 + Origin_CollectionView_Horizental_Distance * 3);
        
        self.CollectionView_Vertical_Distance = Origin_CollectionView_Vertical_Distance * Ratio_Per_PX;
        self.CollectionView_Horizental_Distance = Origin_CollectionView_Horizental_Distance * Ratio_Per_PX;
        
        self.Cell_Width = Origin_Cell_Width * Ratio_Per_PX;
        self.Cell_Height = Origin_Cell_Height * Ratio_Per_PX;
        self.Cell_Corner_Radius = Origin_Cell_Corner_Radius * Ratio_Per_PX;
        
        // CollectionView Size
        float Origin_CollectionView_Width = Origin_Cell_Width * 4 + Origin_CollectionView_Horizental_Distance * 3;
        float Origin_CollectionView_Height = Origin_Cell_Height * 4 + Origin_CollectionView_Vertical_Distance * 3;
        
        self.CollectionView_Width = Origin_CollectionView_Width * Ratio_Per_PX;
        self.CollectionView_Height = Origin_CollectionView_Height * Ratio_Per_PX;
        
        //--------------------- Cell Background Gradient Layer -----------------------
        self.Cell_Background_White_Gradient_Color = [[NSMutableArray alloc] initWithArray:@[
            (id)[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255/255.0 alpha:1.0].CGColor,
            (id)[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255/255.0 alpha:1.0].CGColor]];
        self.Cell_Background_Red_Gradient_Color = [[NSMutableArray alloc] initWithArray:@[
            (id)[UIColor colorWithRed:255.0/255.0 green:10.0/255.0 blue:108.0/255.0 alpha:1.0].CGColor,
            (id)[UIColor colorWithRed:255.0/255.0 green:37.0/255.0 blue:37.0/255.0 alpha:1.0].CGColor]];
        self.Cell_Background_Gradient_Start_Point = CGPointMake(0.0, sqrt(3));
        self.Cell_Background_Gradient_End_Point = CGPointMake(1.0, 0);
        
        //--------------------- Bed Nubmer Label -----------------------
        float Origin_Bed_Number_Label_Text_Size = 12.0;
        self.Bed_Number_TextAlignment = NSTextAlignmentCenter;
        self.Bed_Number_Label_Text_Size = Origin_Bed_Number_Label_Text_Size * Ratio_Per_PX;
    }
    return self;
}
@end
