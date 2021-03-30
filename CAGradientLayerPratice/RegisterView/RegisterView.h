//
//  RegisterView.h
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RegisterView;

@protocol RegisterViewDelegate <NSObject>

@optional

@end


@interface RegisterView : UIView
typedef NS_ENUM(NSInteger, CollectionViewCellViewEnum) {
    DeviceOthers = -1,
    DeviceNotYetConnect = 1,
    DeviceConnectMoreThanOne = 2,
    DeviceConnectExactlyOne = 3,
};

@property (strong, nonatomic) id <RegisterViewDelegate> delegate;

@property (assign, nonatomic) float DevicesStatus;


- (void) entranceMethod : (UIView *) Content_View;
@end

NS_ASSUME_NONNULL_END
