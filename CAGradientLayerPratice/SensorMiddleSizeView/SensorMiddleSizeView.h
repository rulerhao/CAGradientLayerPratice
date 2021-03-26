//
//  SensorMiddleSizeView.h
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SensorMiddleSizeView;

@protocol SensorMiddleSizeViewDelegate <NSObject>

@optional
@end

@interface SensorMiddleSizeView : UIView

@property (strong, nonatomic) id <SensorMiddleSizeViewDelegate> delegate;

- (void) entranceMethod : (UIView *) Content_View;
- (void) cellInit : (UICollectionViewCell *) Cell;
@end

NS_ASSUME_NONNULL_END
