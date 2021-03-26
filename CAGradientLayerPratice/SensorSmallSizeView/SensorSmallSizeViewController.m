//
//  SensorMiddleSizeViewController.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/25.
//

#import "SensorSmallSizeViewController.h"
#import "SensorSmallSizeView.h"
#import "SensorSmallSizeViewSetting.h"
@interface SensorSmallSizeViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    SensorSmallSizeViewSetting *sensorSmallSizeViewSetting;
}
@property (strong, nonatomic) SensorSmallSizeView *sensorSmallSizeView;
@property (strong, nonatomic) UICollectionView *CardCollectionView;

@end

@implementation SensorSmallSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) initView {
    sensorSmallSizeViewSetting = [[SensorSmallSizeViewSetting alloc] init];
    
    self.sensorSmallSizeView = [SensorSmallSizeView alloc];
    self.sensorSmallSizeView.delegate = self;
    [self.sensorSmallSizeView entranceMethod:self.view];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 16;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CardCollectionViewIdentifier" forIndexPath:indexPath];
    // 1 為 原本的 UIVIEW
    // 藉此判定是否要新增 Cell 中的 View
    if ([[cell subviews] count] == 1 || [[cell subviews] count] == 0) {
        NSLog(@"CardCollectionViewCell");
        [self.sensorSmallSizeView cellInit:cell];
    }
    else {
        
    }
    UIView *Background_View = [cell viewWithTag:1];
    UILabel *Bed_Nubmer_Label = [cell viewWithTag:2];
    UIImageView *Breath_Status_ImageView = [cell viewWithTag:3];
    UILabel *Temperature_Label = [cell viewWithTag:4];
    UIImageView *Battery_Volume_ImageView = [cell viewWithTag:5];
    UIImageView *Baby_Photo_ImageView = [cell viewWithTag:6];
    UIView *Baby_Photo_Mask_View = [cell viewWithTag:7];
    UILabel *Name_Label = [cell viewWithTag:8];
    
    return cell;
}

// ---------------------- Cell 大小 ------------------------
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"ReSizeCollectionView");
    return CGSizeMake(sensorSmallSizeViewSetting.Cell_Width, sensorSmallSizeViewSetting.Cell_Height);
}
// ---------------------- 上下 cell 的間距 ------------------------
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return sensorSmallSizeViewSetting.CollectionView_Vertical_Distance - 1;
}

// ---------------------- 左右 cell 的間距 ------------------------
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return sensorSmallSizeViewSetting.CollectionView_Horizental_Distance - 1;
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
