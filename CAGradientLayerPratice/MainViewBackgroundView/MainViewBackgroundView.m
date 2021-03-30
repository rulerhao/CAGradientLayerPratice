//
//  MainViewBackgroundView.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/29.
//
#import "MainViewBackgroundView.h"
#import "MainViewBackgroundViewSetting.h"
#import <Masonry.h>
@interface MainViewBackgroundView ()
{
    MainViewBackgroundViewSetting *mainViewBackgroundViewSetting;
}

@property (strong, nonatomic) UIView *Content_View;

@property (strong, nonatomic) UIImageView *OUCare_Icon_ImageView;
@end

@implementation MainViewBackgroundView
- (void) entranceMethod : (UIView *) Content_View {
    mainViewBackgroundViewSetting = [[MainViewBackgroundViewSetting alloc] init];
    
    self.Content_View = Content_View;
    
    [self viewInit];
    
    [self updateConstraints];

    [self writeLayers];
}

- (void) viewInit {
    self.OUCare_Icon_ImageView = [[UIImageView alloc] initWithImage:mainViewBackgroundViewSetting.OUCare_Icon_Image];
    [self.Content_View addSubview:self.OUCare_Icon_ImageView];
    
    self.Content_View.backgroundColor = mainViewBackgroundViewSetting.OUCare_Main_View_Background_Color;
}

- (void) updateConstraints {
    [super updateConstraints];
    
    [self.OUCare_Icon_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.Content_View.mas_bottom).multipliedBy(mainViewBackgroundViewSetting.OUCare_Icon_Top_Percentage_For_This_Controller_Bottom);
        make.width.equalTo(self.Content_View.mas_width).multipliedBy(mainViewBackgroundViewSetting.OUCare_Icon_Width_Percentage_For_This_Controller);
        make.centerX.equalTo(self.Content_View.mas_centerX);
        make.height.equalTo(self.OUCare_Icon_ImageView.mas_width).multipliedBy(self.OUCare_Icon_ImageView.image.size.height / self.OUCare_Icon_ImageView.image.size.width);
    }];
    
}

- (void) writeLayers {
    
}
@end
