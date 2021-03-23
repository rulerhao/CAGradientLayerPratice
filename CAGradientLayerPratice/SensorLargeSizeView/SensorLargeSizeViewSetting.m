//
//  SensorLargeSizeViewSetting.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/23.
//

#import "SensorLargeSizeViewSetting.h"

@implementation SensorLargeSizeViewSetting
- (instancetype) init {
    self = [super init];
    if (self) {
        UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
        
        CGSize Whole_View_Size = CGSizeMake(window.screen.bounds.size.width, window.screen.bounds.size.height);
        CGSize Safe_View_Size = CGSizeMake(window.safeAreaLayoutGuide.layoutFrame.size.width, window.safeAreaLayoutGuide.layoutFrame.size.height);
        
        
    }
    return self;
}

@end
