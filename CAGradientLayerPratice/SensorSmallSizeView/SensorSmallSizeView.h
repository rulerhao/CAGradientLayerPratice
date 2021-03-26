//
//  SensorSmallSizeView.h
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SensorSmallSizeView;

@protocol SensorSmallSizeViewDelegate <NSObject>

@optional
@end

@interface SensorSmallSizeView : UIView

@property (strong, nonatomic) id <SensorSmallSizeViewDelegate> delegate;

- (void) entranceMethod : (UIView *) Content_View;
- (void) cellInit : (UICollectionViewCell *) Cell;
@end

NS_ASSUME_NONNULL_END
