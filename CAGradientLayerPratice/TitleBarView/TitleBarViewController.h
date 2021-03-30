//
//  TitleBarViewController.h
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/23.
//

#import <UIKit/UIKit.h>
#import "TitleBarView.h"
#import "TitleBarViewSetting.h"
NS_ASSUME_NONNULL_BEGIN

@interface TitleBarViewController : UIViewController <TitleBarViewDelegate>
- (void) initView;
@end

NS_ASSUME_NONNULL_END
