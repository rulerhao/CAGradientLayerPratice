//
//  LoadingViewSetting.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/22.
//

#import "LoadingViewSetting.h"
@interface LoadingViewSetting ()
{
    float Origin_Whole_View_Size_Scale;
}
@end

@implementation LoadingViewSetting
- (instancetype) init {
    self = [super init];
    if (self) {
        UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
        
        CGSize Whole_View_Size = CGSizeMake(window.screen.bounds.size.width, window.screen.bounds.size.height);
        CGSize Safe_View_Size = CGSizeMake(window.safeAreaLayoutGuide.layoutFrame.size.width, window.safeAreaLayoutGuide.layoutFrame.size.height);
        
        Origin_Whole_View_Size_Scale = 428.0f / 926.0f;
        //--------------------- Loading Background Top View -----------------------
        self.Loading_Background_Top_Image = [UIImage imageNamed:@"MUL OUcare-15 形象頁up.png"];
        self.Loading_Background_Top_Image_Height_Scale = 0.4;
        self.Loading_Background_Top_Image_Width_Scale = 0.9;
        //--------------------- Loading Background Bottom View -----------------------
        self.Loading_Background_Bottom_Image = [UIImage imageNamed:@"MUL OUcare-16 形象頁down.png"];
        self.Loading_Background_Bottom_Image_Height_Scale = 0.4;
        self.Loading_Background_Bottom_Image_Width_Scale = 0.9;
        
        //--------------------- Loading Title View -----------------------
        self.Loading_Title_Image = [UIImage imageNamed:@"MUL OUcare_01 主頁.png"];
        
        // 比較寬的螢幕
        if(Whole_View_Size.width / Whole_View_Size.height >= Origin_Whole_View_Size_Scale) {
            self.Loading_Title_Image_Height_Scale = 0.25;
            self.Loading_Title_Image_Width_Scale = Whole_View_Size.height * self.Loading_Title_Image_Height_Scale / self.Loading_Title_Image.size.height * self.Loading_Title_Image.size.width / Whole_View_Size.width;
        }
        // 比較長的螢幕
        else {
            self.Loading_Title_Image_Width_Scale = 0.5;
            self.Loading_Title_Image_Height_Scale = Whole_View_Size.width * self.Loading_Title_Image_Width_Scale / Whole_View_Size.height / self.Loading_Title_Image.size.width * self.Loading_Title_Image.size.height;
        }
    }
    return self;
}
@end
