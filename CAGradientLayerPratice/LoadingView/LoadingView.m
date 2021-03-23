//
//  LoadingView.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/22.
//

#import "LoadingView.h"
#import "LoadingViewSetting.h"
#import <Masonry.h>
@interface LoadingView ()
{
    LoadingViewSetting *loadingViewSetting;
}

@property (strong, nonatomic) UIView *Content_View;

@property (strong, nonatomic) UIImageView *Loading_Background_Top_ImageView;
@property (strong, nonatomic) UIImageView *Loading_Background_Bottom_ImageView;
@property (strong, nonatomic) UIImageView *Loading_Title_ImageView;
@end

@implementation LoadingView
- (void) entranceMethod : (UIView *) Content_View {
    loadingViewSetting = [[LoadingViewSetting alloc] init];
    
    self.Content_View = Content_View;
    
    [self viewInit];
    
    [self updateConstraints];
    
    [self writeLayers];
}

- (void) viewInit {
    //--------------------- Loading Background Top View -----------------------
    self.Loading_Background_Top_ImageView = [[UIImageView alloc] init];
    self.Loading_Background_Top_ImageView.image = loadingViewSetting.Loading_Background_Top_Image;
    [self.Content_View addSubview:self.Loading_Background_Top_ImageView];
    
    //--------------------- Loading Background Bottom View -----------------------
    self.Loading_Background_Bottom_ImageView = [[UIImageView alloc] init];
    self.Loading_Background_Bottom_ImageView.image = loadingViewSetting.Loading_Background_Bottom_Image;
    [self.Content_View addSubview:self.Loading_Background_Bottom_ImageView];
    
    //--------------------- Loading Title View -----------------------
    self.Loading_Title_ImageView = [[UIImageView alloc] init];
    self.Loading_Title_ImageView.image = loadingViewSetting.Loading_Title_Image;
    [self.Content_View addSubview:self.Loading_Title_ImageView];
}

- (void) updateConstraints {
    [super updateConstraints];
    
    //--------------------- Loading Background Top View -----------------------
    [self.Loading_Background_Top_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Content_View.mas_top);
        make.height.equalTo(self.Content_View.mas_height).multipliedBy(loadingViewSetting.Loading_Background_Top_Image_Height_Scale);
        make.left.equalTo(self.Content_View.mas_left);
        make.width.equalTo(self.Content_View.mas_width).multipliedBy(loadingViewSetting.Loading_Background_Top_Image_Width_Scale);
    }];
    
    //--------------------- Loading Background Bottom View -----------------------
    [self.Loading_Background_Bottom_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.Content_View.mas_bottom);
        make.height.equalTo(self.Content_View.mas_height).multipliedBy(loadingViewSetting.Loading_Background_Bottom_Image_Height_Scale);
        make.right.equalTo(self.Content_View.mas_right);
        make.width.equalTo(self.Content_View.mas_width).multipliedBy(loadingViewSetting.Loading_Background_Bottom_Image_Width_Scale);
    }];
    
    //--------------------- Loading Title View -----------------------
    [self.Loading_Title_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.Content_View.mas_centerX);
        make.centerY.equalTo(self.Content_View.mas_centerY);
        make.height.equalTo(self.Content_View.mas_height).multipliedBy(loadingViewSetting.Loading_Title_Image_Height_Scale);
        make.width.equalTo(self.Content_View.mas_width).multipliedBy(loadingViewSetting.Loading_Title_Image_Width_Scale);
    }];
}

- (void) writeLayers {
    
}
@end
