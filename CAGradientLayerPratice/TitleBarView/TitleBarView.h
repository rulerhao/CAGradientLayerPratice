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
- (void) titleButtonBeClicked : (UIButton *) Sender;
@end

@interface TitleBarView : UIView
- (void) entranceMethod : (UIView *) Content_View;
typedef NS_ENUM(NSInteger, FunctionButtonEnum) {
    ButtonHaveNotThing = -1,
    SensorController = 1,
    RegisterController = 2
};
@property (strong, nonatomic) id <TitleBarViewDelegate> delegate;
@property (strong, nonatomic) UIButton *Left_Button;
@property (strong, nonatomic) UIButton *Right_Button;
@property (strong, nonatomic) NSMutableArray <UIButton *> *Button_Array_List;
@property (strong, nonatomic) NSMutableArray <UILabel *> *Button_Label_Array_List;
@property (strong, nonatomic) NSMutableArray <UIView *> *Button_Line_View_Array_List;

@end
