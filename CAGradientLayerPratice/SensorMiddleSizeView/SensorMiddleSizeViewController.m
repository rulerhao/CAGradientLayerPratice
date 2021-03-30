//
//  SensorMiddleSizeViewController.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/25.
//

#import "SensorMiddleSizeViewController.h"
#import "SensorMiddleSizeView.h"
#import "SensorMiddleSizeViewSetting.h"
@interface SensorMiddleSizeViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    SensorMiddleSizeViewSetting *sensorMiddleSizeViewSetting;
}
@property (strong, nonatomic) SensorMiddleSizeView *sensorMiddleSizeView;
@property (strong, nonatomic) UICollectionView *CardCollectionView;

@end

@implementation SensorMiddleSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) initView {
    sensorMiddleSizeViewSetting = [[SensorMiddleSizeViewSetting alloc] init];
    
    self.sensorMiddleSizeView = [SensorMiddleSizeView alloc];
    self.sensorMiddleSizeView.delegate = self;
    [self.sensorMiddleSizeView entranceMethod:self.view];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CardCollectionViewIdentifier" forIndexPath:indexPath];
    // 1 為 原本的 UIVIEW
    // 藉此判定是否要新增 Cell 中的 View
    if ([[cell subviews] count] == 1 || [[cell subviews] count] == 0) {
        NSLog(@"CardCollectionViewCell");
        [self.sensorMiddleSizeView cellInit:cell];
    }
    else {
        
    }
    UIView *Background_View = [cell viewWithTag:BackgroundViewTag];
    UILabel *Bed_Nubmer_Label = [cell viewWithTag:BedNumberLabelTag];
    UIImageView *Breath_Status_ImageView = [cell viewWithTag:BreathStatusImageViewTag];
    UILabel *Temperature_Label = [cell viewWithTag:TemperatureLabelTag];
    UIImageView *Battery_Volume_ImageView = [cell viewWithTag:BatteryVolumeImageViewTag];
    UIImageView *Baby_Photo_ImageView = [cell viewWithTag:BabyPhotoImageViewTag];
    UIView *Baby_Photo_Mask_View = [cell viewWithTag:BabyPhotoMaskViewTag];
    UILabel *Name_Label = [cell viewWithTag:NameLabelTag];
    
    return cell;
}

// ---------------------- Cell 大小 ------------------------
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"ReSizeCollectionView");
    return CGSizeMake(sensorMiddleSizeViewSetting.Cell_Width, sensorMiddleSizeViewSetting.Cell_Height);
}
// ---------------------- 上下 cell 的間距 ------------------------
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return sensorMiddleSizeViewSetting.CollectionView_Vertical_Distance - 1;
}

// ---------------------- 左右 cell 的間距 ------------------------
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return sensorMiddleSizeViewSetting.CollectionView_Horizental_Distance - 1;
}

// ---------------------- 上左下右距離邊界距離 ------------------------
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void) didReceivePinchGesture : (UIPinchGestureRecognizer *) gesture {
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        NSLog(@"State Began");
//     scaleStart = self.scale;
    }
    else if (gesture.state == UIGestureRecognizerStateChanged) {
        NSLog(@"State Change");
//     self.scale = scaleStart * gesture.scale;
//     [self.collectionView.collectionViewLayout invalidateLayout];
    }
    else if (gesture.state == UIGestureRecognizerStateEnded) {
        if(gesture.scale > 1) {
            
        }
        else {
            
        }
        NSLog(@"State Ended");
    }
}

@end
