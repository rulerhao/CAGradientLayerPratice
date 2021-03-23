//
//  SensorLargeSizeView.h
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SensorLargeSizeView;

@protocol SensorLargeSizeViewDelegate <NSObject>

@optional
@end

@interface SensorLargeSizeView : UIView

@property (strong, nonatomic) id <SensorLargeSizeViewDelegate> delegate;

- (void) entranceMethod : (UIView *) Content_View;
- (UICollectionViewCell *) getInitCell : (UICollectionViewCell *) Cell;


@end

NS_ASSUME_NONNULL_END
