//
//  SensorLargeSizeViewController.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/23.
//

#import "SensorLargeSizeViewController.h"
#import "GradientBackgroundView.h"

@interface SensorLargeSizeViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *CollectionView;
@property (strong, nonatomic) SensorLargeSizeView *sensorLargeSizeView;


@end

@implementation SensorLargeSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) initView {
    self.sensorLargeSizeView = [SensorLargeSizeView alloc];
    self.sensorLargeSizeView.delegate = self;
    [self.sensorLargeSizeView entranceMethod:self.view];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewIdentifier" forIndexPath:indexPath];
    // 1 為 原本的 UIVIEW
    // 藉此判定是否要新增 Cell 中的 View
    if ([[cell subviews] count] == 1 || [[cell subviews] count] == 0) {
        NSLog(@"createCollectionViewCell");
        cell = [self.sensorLargeSizeView getInitCell:cell];
    }
    else {
        
    }
    
    UIImageView *Background_ImageView = [cell viewWithTag:1];
    UIImageView *Baby_Photo_Background_ImageView = [cell viewWithTag:2];
    UITextView *Serial_TextView = [cell viewWithTag:4];
    UITextView *Baby_Name_TextView = [cell viewWithTag:8];
    
    UIImageView *Baby_Information_Bar1_ImageView = [cell viewWithTag:9];
    UIImageView *Baby_Information_Bar2_ImageView = [cell viewWithTag:10];
    UIImageView *Baby_Information_Bar3_ImageView = [cell viewWithTag:11];
    
    UITextView *Movement_TextView = [cell viewWithTag:5];
    UITextView *Temperature_TextView = [cell viewWithTag:6];
    UITextView *Battery_TextView = [cell viewWithTag:7];
    
    return cell;
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
