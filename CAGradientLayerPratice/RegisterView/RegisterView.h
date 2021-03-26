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
@property (strong, nonatomic) id <RegisterViewDelegate> delegate;


- (void) entranceMethod : (UIView *) Content_View;
@end

NS_ASSUME_NONNULL_END
