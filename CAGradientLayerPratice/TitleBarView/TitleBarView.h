//
//  TitleBarView.h
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/22.
//

#import <UIKit/UIKit.h>


@class TitleBarView;

@protocol TitleBarViewDelegate <NSObject>

@optional

@end

@interface TitleBarView : UIView
- (void) entranceMethod : (UIView *) Content_View;

@property (strong, nonatomic) id <TitleBarViewDelegate> delegate;
@property (strong, nonatomic) UIButton *Left_Button;
@property (strong, nonatomic) UIButton *Right_Button;
@property (strong, nonatomic) NSMutableArray *Button_Array_List;

@end
