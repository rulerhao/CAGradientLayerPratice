//
//  BackgroundView.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/22.
//

#import "BackgroundView.h"
#import "BackgroundViewSetting.h"
#import <Masonry.h>
@interface BackgroundView ()
{
    BackgroundViewSetting *backgroundViewSetting;
}
@property (strong, nonatomic) UIView *Content_View;

@property (strong, nonatomic) UIImageView *Log_In_Paint_ImageView;

@property (strong, nonatomic) CAGradientLayer *Log_In_Background_Gradient_Layer;

@end

@implementation BackgroundView

- (instancetype)init
{
    self = [super init];
    if (self) {
        backgroundViewSetting = [[BackgroundViewSetting alloc] init];
        
        [self viewInit];
        
        [self updateConstraints];
        
        [self writeLayers];
    }
    return self;
}

- (void) entranceMethod : (UIView *) Content_View {
    self.Content_View = Content_View;
    
    backgroundViewSetting = [[BackgroundViewSetting alloc] init];
    
    [self viewInit];
    
    [self updateConstraints];
    
    [self writeLayers];
}

- (void) viewInit {
    //--------------------- Background Gradient Layer -----------------------
    self.Log_In_Background_Gradient_Layer = [[CAGradientLayer alloc] init];
    self.Log_In_Background_Gradient_Layer.frame = self.Content_View.bounds;
    self.Log_In_Background_Gradient_Layer.colors = backgroundViewSetting.Log_In_Background_Gradient_Layer_Color;
    self.Log_In_Background_Gradient_Layer.startPoint = backgroundViewSetting.Log_In_Background_Gradient_Layer_Start_Point;
    self.Log_In_Background_Gradient_Layer.endPoint = backgroundViewSetting.Log_In_Background_Gradient_Layer_End_Point;
    [self.Content_View.layer addSublayer:self.Log_In_Background_Gradient_Layer];
    
    //--------------------- Log In Paint Image View -----------------------
    self.Log_In_Paint_ImageView = [[UIImageView alloc] init];
    self.Log_In_Paint_ImageView.image = backgroundViewSetting.Log_In_Paint_Image;
    [self.Content_View addSubview:self.Log_In_Paint_ImageView];
}

- (void) updateConstraints {
    [super updateConstraints];
    
    //--------------------- Log In Paint Image View -----------------------
    [self.Log_In_Paint_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Content_View.mas_bottom).offset(- backgroundViewSetting.Log_In_Paint_Image_Size.height);
        make.bottom.equalTo(self.Content_View.mas_bottom);
        make.left.equalTo(self.Content_View.mas_left);
        make.right.equalTo(self.Content_View.mas_right);
    }];
}

- (void) writeLayers {
}

@end
