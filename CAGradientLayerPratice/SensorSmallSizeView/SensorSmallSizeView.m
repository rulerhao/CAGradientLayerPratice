//
//  SensorSmallSizeView.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/26.
//

#import "SensorSmallSizeView.h"
#import "SensorSmallSizeViewSetting.h"
#import <Masonry.h>

@interface SensorSmallSizeView ()
{
    SensorSmallSizeViewSetting *sensorSmallSizeViewSetting;
}
@property (strong, nonatomic) UIView *Content_View;
@property (strong, nonatomic) UICollectionView *CardCollectionView;
@end

@implementation SensorSmallSizeView
- (void) entranceMethod : (UIView *) Content_View {
    sensorSmallSizeViewSetting = [[SensorSmallSizeViewSetting alloc] init];
    
    self.Content_View = Content_View;
    
    [self viewInit];
    
    [self updateConstraints];

    [self writeLayers];
    
    
}

- (void) viewInit {
    UICollectionViewFlowLayout *CardCollectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    CardCollectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.CardCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:CardCollectionViewLayout];
    [self.CardCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CardCollectionViewIdentifier"];
    self.CardCollectionView.delegate = self.delegate;
    self.CardCollectionView.dataSource = self.delegate;
    self.CardCollectionView.backgroundColor = [UIColor clearColor];
    [self.Content_View addSubview: self.CardCollectionView];
}

- (void) updateConstraints {
    [super updateConstraints];
    
    //--------------------- Person Background ImageView -----------------------
    [self.CardCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.Content_View.mas_centerX);
        make.centerY.equalTo(self.Content_View.mas_centerY);
        make.width.equalTo(@(sensorSmallSizeViewSetting.CollectionView_Width));
        make.height.equalTo(@(sensorSmallSizeViewSetting.CollectionView_Height));
    }];
    
}

- (void) writeLayers {
    
}

- (void) cellInit : (UICollectionViewCell *) Cell {
    sensorSmallSizeViewSetting.Cell_Background_Gradient_Color = sensorSmallSizeViewSetting.Cell_Background_White_Gradient_Color;
    
    [self cellViewInit:Cell];
    
    [self cellConstraints:Cell];
    
    [self cellWriteLayers:Cell];
}

// ------------- Init cell view ----------------
- (void) cellViewInit : (UICollectionViewCell *) Cell {
    UIView *Background_View;
    UILabel *Bed_Nubmer_Label;
    
    //--------------------- Background View -----------------------
    Background_View = [[UIView alloc] initWithFrame:CGRectZero];
    Background_View.tag = 1;
    [Cell addSubview:Background_View];
    
    //--------------------- Bed Nubmer Label -----------------------
    Bed_Nubmer_Label = [[UILabel alloc] initWithFrame:CGRectZero];
    Bed_Nubmer_Label.tag = 2;
    Bed_Nubmer_Label.text = @"01";
    Bed_Nubmer_Label.font = [UIFont fontWithName:@"Helvetica" size:sensorSmallSizeViewSetting.Bed_Number_Label_Text_Size];
    Bed_Nubmer_Label.textAlignment = sensorSmallSizeViewSetting.Bed_Number_TextAlignment;
    [Cell addSubview:Bed_Nubmer_Label];
    
}

// --------- Constraints for collectionView  cell -------------
- (void) cellConstraints : (UICollectionViewCell *) Cell {
    UIView *Background_View = [Cell viewWithTag:BackgroundViewTag];
    UILabel *Bed_Nubmer_Label = [Cell viewWithTag:BedNumberLabelTag];
    
    //--------------------- Background View -----------------------
    [Background_View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Cell.mas_top).offset(0);
        make.left.equalTo(Cell.mas_left).offset(0);
        make.width.equalTo(@(sensorSmallSizeViewSetting.Cell_Width));
        make.height.equalTo(@(sensorSmallSizeViewSetting.Cell_Height));
    }];
    
    //--------------------- Bed Nubmer Label -----------------------
    [Bed_Nubmer_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(Cell.mas_centerX);
        make.centerY.equalTo(Cell.mas_centerY);
    }];
    
    [Cell layoutIfNeeded];
}

// ------------- Draw for CALayer or CAShapeLayer ------------
- (void) cellWriteLayers : (UICollectionViewCell *) Cell {
    UIView *Background_View = [Cell viewWithTag:BackgroundViewTag];
    UILabel *Bed_Number_Label = [Cell viewWithTag:BedNumberLabelTag];
    
    //--------------------- Background View -----------------------
    CAShapeLayer *Card_Background_Shape_Layer = [[CAShapeLayer alloc] init];
    
    UIBezierPath *Background_Path1 = [[UIBezierPath alloc] init];
    Background_Path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, sensorSmallSizeViewSetting.Cell_Width, sensorSmallSizeViewSetting.Cell_Height) cornerRadius:sensorSmallSizeViewSetting.Cell_Corner_Radius];
    [Card_Background_Shape_Layer setPath:Background_Path1.CGPath];
    [Card_Background_Shape_Layer setFillRule:kCAFillRuleEvenOdd];
    Background_View.layer.mask = Card_Background_Shape_Layer;
    Cell.layer.shadowOffset = CGSizeMake(0, 0);
    Cell.layer.shadowOpacity = 1;
    Cell.layer.shadowRadius = 1;
    Cell.layer.shadowColor = [[UIColor greenColor] CGColor];
    
    /* Set gradient color for card */
    CAGradientLayer *Card_Background_Gradient_Layer = [[CAGradientLayer alloc] init];
    Card_Background_Gradient_Layer.frame = Background_View.bounds;
//    Card_Background_Gradient_Layer.colors = sensorMiddleSizeViewSetting.Cell_Background_Red_Gradient_Color;
    Card_Background_Gradient_Layer.colors = sensorSmallSizeViewSetting.Cell_Background_Gradient_Color;
    Card_Background_Gradient_Layer.startPoint = sensorSmallSizeViewSetting.Cell_Background_Gradient_Start_Point;
    Card_Background_Gradient_Layer.endPoint = sensorSmallSizeViewSetting.Cell_Background_Gradient_End_Point;
    [Background_View.layer addSublayer:Card_Background_Gradient_Layer];
}
@end
