//
//  SensorMiddleSizeView.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/25.
//

#import "SensorMiddleSizeView.h"
#import "SensorMiddleSizeViewSetting.h"
#import <Masonry.h>

@interface SensorMiddleSizeView ()
{
    SensorMiddleSizeViewSetting *sensorMiddleSizeViewSetting;
}
@property (strong, nonatomic) UIView *Content_View;
@property (strong, nonatomic) UICollectionView *CardCollectionView;
@end

@implementation SensorMiddleSizeView
- (void) entranceMethod : (UIView *) Content_View {
    sensorMiddleSizeViewSetting = [[SensorMiddleSizeViewSetting alloc] init];
    
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
        make.width.equalTo(@(sensorMiddleSizeViewSetting.CollectionView_Width));
        make.height.equalTo(@(sensorMiddleSizeViewSetting.CollectionView_Height));
    }];
    
}

- (void) writeLayers {
    
}

- (void) cellInit : (UICollectionViewCell *) Cell {
    sensorMiddleSizeViewSetting.Cell_Background_Gradient_Color = sensorMiddleSizeViewSetting.Cell_Background_White_Gradient_Color;;
    
    [self cellViewInit:Cell];
    
    [self cellConstraints:Cell];
    
    [self cellWriteLayers:Cell];
}

// ------------- Init cell view ----------------
- (void) cellViewInit : (UICollectionViewCell *) Cell {
    UIView *Background_View;
    UILabel *Bed_Nubmer_Label;
    UIImageView *Breath_Status_ImageView;
    UILabel *Temperature_Label;
    UIImageView *Battery_Volume_ImageView;
    UIImageView *Baby_Photo_ImageView;
    UIView *Baby_Photo_Mask_View;
    UILabel *Name_Label;
    
    //--------------------- Background View -----------------------
    Background_View = [[UIView alloc] initWithFrame:CGRectZero];
    Background_View.tag = 1;
//    Background_View.backgroundColor = [UIColor yellowColor];
    [Cell addSubview:Background_View];
    
    //--------------------- Bed Nubmer Label -----------------------
    Bed_Nubmer_Label = [[UILabel alloc] initWithFrame:CGRectZero];
    Bed_Nubmer_Label.tag = 2;
    Bed_Nubmer_Label.text = @"01";
    Bed_Nubmer_Label.font = [UIFont fontWithName:@"Helvetica" size:sensorMiddleSizeViewSetting.Bed_Number_Label_Text_Size];
    Bed_Nubmer_Label.textAlignment = sensorMiddleSizeViewSetting.Bed_Number_TextAlignment;
    [Cell addSubview:Bed_Nubmer_Label];
    
    //--------------------- Breath Status ImageView -----------------------
    Breath_Status_ImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    Breath_Status_ImageView.tag = 3;
    Breath_Status_ImageView.image = sensorMiddleSizeViewSetting.Breath_Status_Image;
    [Cell addSubview:Breath_Status_ImageView];
    
    //--------------------- Temperature Label -----------------------
    Temperature_Label = [[UILabel alloc] initWithFrame:CGRectZero];
    Temperature_Label.tag = 4;
    Temperature_Label.text = @"36.5";
    Temperature_Label.font = [UIFont fontWithName:@"Helvetica" size:sensorMiddleSizeViewSetting.Temperature_Label_Text_Size];
    Temperature_Label.textAlignment = sensorMiddleSizeViewSetting.Bed_Number_TextAlignment;
    [Cell addSubview:Temperature_Label];
    
    //--------------------- Battery Volume ImageView -----------------------
    Battery_Volume_ImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    Battery_Volume_ImageView.tag = 5;
    Battery_Volume_ImageView.image = sensorMiddleSizeViewSetting.Battery_ImageView_Photo_Image;
    [Cell addSubview:Battery_Volume_ImageView];
    
    //--------------------- Baby Photo ImageView -----------------------
    Baby_Photo_ImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    Baby_Photo_ImageView.tag = 6;
    Baby_Photo_ImageView.image = [UIImage imageNamed:@"shutterstock_1351910084.jpg"];
    [Cell addSubview:Baby_Photo_ImageView];
    
    //--------------------- Baby Photo Mask View -----------------------
    Baby_Photo_Mask_View = [[UIView alloc] initWithFrame:CGRectZero];
//    Baby_Photo_Mask_View.backgroundColor = [UIColor greenColor];
    Baby_Photo_Mask_View.tag = 7;
    [Cell addSubview:Baby_Photo_Mask_View];
    
    //--------------------- Name Label -----------------------
    Name_Label = [[UILabel alloc] initWithFrame:CGRectZero];
    Name_Label.tag = 8;
    Name_Label.text = @"Max";
    Name_Label.backgroundColor = sensorMiddleSizeViewSetting.Name_Label_Background_Color;
    Name_Label.textAlignment = sensorMiddleSizeViewSetting.Name_Label_TextAlignment;
    [Cell addSubview:Name_Label];
}

// --------- Constraints for collectionView  cell -------------
- (void) cellConstraints : (UICollectionViewCell *) Cell {
//    Cell.backgroundColor = [UIColor blueColor];
//    UIView *Background_View = [UIView alloc];
    UIView *Background_View = [Cell viewWithTag:BackgroundViewTag];
    UILabel *Bed_Nubmer_Label = [Cell viewWithTag:BedNumberLabelTag];
    UIImageView *Breath_Status_ImageView = [Cell viewWithTag:BreathStatusImageViewTag];
    UILabel *Temperature_Label = [Cell viewWithTag:TemperatureLabelTag];
    UIImageView *Battery_Volume_ImageView = [Cell viewWithTag:BatteryVolumeImageViewTag];
    UIImageView *Baby_Photo_ImageView = [Cell viewWithTag:BabyPhotoImageViewTag];
    UIView *Baby_Photo_Mask_View = [Cell viewWithTag:BabyPhotoMaskViewTag];
    UILabel *Name_Label = [Cell viewWithTag:NameLabelTag];
    
    //--------------------- Background View -----------------------
    NSLog(@"self.ContentView = %@", self.Content_View);
    [Background_View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Cell.mas_top).offset(0);
        make.left.equalTo(Cell.mas_left).offset(0);
        make.width.equalTo(@(sensorMiddleSizeViewSetting.Cell_Width));
        make.height.equalTo(@(sensorMiddleSizeViewSetting.Cell_Height));
    }];
    //--------------------- Bed Nubmer Label -----------------------
    [Bed_Nubmer_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Cell.mas_top).offset(sensorMiddleSizeViewSetting.Bed_Number_Label_Top_Distance);
        make.centerX.equalTo(Cell.mas_centerX);
    }];
    //--------------------- Breath Status ImageView -----------------------
    [Breath_Status_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Cell.mas_top).offset(sensorMiddleSizeViewSetting.Breath_Status_Top_Distance);
        make.centerX.equalTo(Cell.mas_centerX);
        make.width.equalTo(@(sensorMiddleSizeViewSetting.Breath_Status_ImageView_Rect.size.width));
        make.height.equalTo(@(sensorMiddleSizeViewSetting.Breath_Status_ImageView_Rect.size.height));
    }];
    //--------------------- Temperature Label -----------------------
    [Temperature_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Cell.mas_top).offset(sensorMiddleSizeViewSetting.Temperature_Label_Top_Distance);
        make.centerX.equalTo(Cell.mas_centerX);
    }];
    //--------------------- Battery Volume ImageView -----------------------
    [Battery_Volume_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(Baby_Photo_ImageView.mas_top).offset(- sensorMiddleSizeViewSetting.Battery_ImageView_Photo_Distance);
        make.centerX.equalTo(Cell.mas_centerX);
        make.width.equalTo(@(sensorMiddleSizeViewSetting.Battery_ImageView_Rect.size.width));
        make.height.equalTo(@(sensorMiddleSizeViewSetting.Battery_ImageView_Rect.size.height));
    }];
    //--------------------- Baby Photo ImageView -----------------------
    [Baby_Photo_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(Cell.mas_bottom).offset(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.origin.x);
        make.left.equalTo(Cell.mas_left).offset(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.origin.y);
        make.width.equalTo(@(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.size.width));
        make.height.equalTo(@(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.size.height));
    }];
    //--------------------- Baby Photo Mask View -----------------------
    [Baby_Photo_Mask_View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(Cell.mas_bottom).offset(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.origin.x);
        make.left.equalTo(Cell.mas_left).offset(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.origin.y);
        make.width.equalTo(@(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.size.width));
        make.height.equalTo(@(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.size.height));
    }];
    //--------------------- Name Label -----------------------
    [Name_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(Cell.mas_bottom);
        make.centerX.equalTo(Cell.mas_centerX);
        make.width.equalTo(@(sensorMiddleSizeViewSetting.Name_Label_Rect.size.width));
        make.height.equalTo(@(sensorMiddleSizeViewSetting.Name_Label_Rect.size.height));
    }];
    [Cell layoutIfNeeded];
}

// ------------- Draw for CALayer or CAShapeLayer ------------
- (void) cellWriteLayers : (UICollectionViewCell *) Cell {
    UIView *Background_View = [Cell viewWithTag:BackgroundViewTag];
    UILabel *Bed_Nubmer_Label = [Cell viewWithTag:BedNumberLabelTag];
    UIImageView *Breath_Status_ImageView = [Cell viewWithTag:BreathStatusImageViewTag];
    UILabel *Temperature_Label = [Cell viewWithTag:TemperatureLabelTag];
    UIImageView *Battery_Volume_ImageView = [Cell viewWithTag:BatteryVolumeImageViewTag];
    UIImageView *Baby_Photo_ImageView = [Cell viewWithTag:BabyPhotoImageViewTag];
    UIView *Baby_Photo_Mask_View = [Cell viewWithTag:BabyPhotoMaskViewTag];
    UILabel *Name_Label = [Cell viewWithTag:NameLabelTag];
    
    //--------------------- Background View -----------------------
    CAShapeLayer *Card_Background_Shape_Layer = [[CAShapeLayer alloc] init];
    
    UIBezierPath *Background_Path1 = [[UIBezierPath alloc] init];
    Background_Path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, sensorMiddleSizeViewSetting.Cell_Width, sensorMiddleSizeViewSetting.Cell_Height) cornerRadius:sensorMiddleSizeViewSetting.Cell_Corner_Radius];
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
    Card_Background_Gradient_Layer.colors = sensorMiddleSizeViewSetting.Cell_Background_Gradient_Color;
    Card_Background_Gradient_Layer.startPoint = sensorMiddleSizeViewSetting.Cell_Background_Gradient_Start_Point;
    Card_Background_Gradient_Layer.endPoint = sensorMiddleSizeViewSetting.Cell_Background_Gradient_End_Point;
    [Background_View.layer addSublayer:Card_Background_Gradient_Layer];
    
    //--------------------- Breath Status ImageView -----------------------
    
    //--------------------- Temperature Label -----------------------
    
    //--------------------- Battery Volume ImageView -----------------------
    
    //--------------------- Baby Photo ImageView -----------------------
    
    CAShapeLayer *Baby_Photo_Shape_Layer = [[CAShapeLayer alloc] init];

    UIBezierPath *Baby_Photo_Path1 = [[UIBezierPath alloc] init];
    Baby_Photo_Path1 = [UIBezierPath bezierPathWithRoundedRect:sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect
                                             byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight
                                                   cornerRadii:CGSizeMake(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Corner_Radious, sensorMiddleSizeViewSetting.Baby_Photo_Rect_Corner_Radious)];
    [Baby_Photo_Shape_Layer setPath:Baby_Photo_Path1.CGPath];
    [Baby_Photo_Shape_Layer setFillRule:kCAFillRuleEvenOdd];
    Baby_Photo_ImageView.layer.mask = Baby_Photo_Shape_Layer;
    
    //--------------------- Baby Photo Mask View -----------------------
    CAShapeLayer *Baby_Photo_Mask_Shape_Layer = [[CAShapeLayer alloc] init];

    UIBezierPath *Baby_Photo_Mask_Path1 = [[UIBezierPath alloc] init];
    Baby_Photo_Mask_Path1 = [UIBezierPath bezierPathWithOvalInRect:sensorMiddleSizeViewSetting.Baby_Photo_Elipstic_Rect];

    UIBezierPath *Baby_Photo_Mask_Path2 = [[UIBezierPath alloc] init];
    Baby_Photo_Mask_Path2 = [UIBezierPath bezierPathWithRoundedRect:sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect
                                                       cornerRadius:sensorMiddleSizeViewSetting.Baby_Photo_Rect_Corner_Radious];
    
    UIBezierPath *Baby_Photo_Mask_Path3 = [[UIBezierPath alloc] init];
    Baby_Photo_Mask_Path3 = [UIBezierPath bezierPathWithRoundedRect:sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect
                                                       cornerRadius:sensorMiddleSizeViewSetting.Baby_Photo_Rect_Corner_Radious];
    
    UIBezierPath *Baby_Photo_Mask_Path4 = [[UIBezierPath alloc] init];
    Baby_Photo_Mask_Path4 = [UIBezierPath bezierPathWithRect:sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect];
    
    [Baby_Photo_Mask_Path1 appendPath:Baby_Photo_Mask_Path2];
    [Baby_Photo_Mask_Path1 appendPath:Baby_Photo_Mask_Path3];
    [Baby_Photo_Mask_Path1 appendPath:Baby_Photo_Mask_Path4];

    [Baby_Photo_Mask_Shape_Layer setPath:Baby_Photo_Mask_Path1.CGPath];
    [Baby_Photo_Mask_Shape_Layer setFillRule:kCAFillRuleEvenOdd];
    Baby_Photo_Mask_View.layer.mask = Baby_Photo_Mask_Shape_Layer;
    
    /* Set gradient color for photo mask */
    CAGradientLayer *Baby_Photo_Mask_Gradient_Layer = [[CAGradientLayer alloc] init];
    Baby_Photo_Mask_Gradient_Layer.frame = Baby_Photo_Mask_View.bounds;
    Baby_Photo_Mask_Gradient_Layer.colors = sensorMiddleSizeViewSetting.Cell_Background_Gradient_Color;
    Baby_Photo_Mask_Gradient_Layer.startPoint = sensorMiddleSizeViewSetting.Cell_Background_Gradient_Start_Point;
    Baby_Photo_Mask_Gradient_Layer.endPoint = sensorMiddleSizeViewSetting.Cell_Background_Gradient_End_Point;
    [Baby_Photo_Mask_View.layer addSublayer:Baby_Photo_Mask_Gradient_Layer];
    
    //--------------------- Name Label -----------------------
    /* Set name label rounded corner background */
    CAShapeLayer *Name_Label_Shape_Layer = [[CAShapeLayer alloc] init];
    
    UIBezierPath *Name_Label_Path1 = [[UIBezierPath alloc] init];
    Name_Label_Path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(sensorMiddleSizeViewSetting.Name_Label_Rect.origin.x,
                                                                          sensorMiddleSizeViewSetting.Name_Label_Rect.origin.y,
                                                                          sensorMiddleSizeViewSetting.Name_Label_Rect.size.width,
                                                                          sensorMiddleSizeViewSetting.Name_Label_Rect.size.height) cornerRadius:sensorMiddleSizeViewSetting.Name_Label_Corner_Radius];
    [Name_Label_Shape_Layer setPath:Name_Label_Path1.CGPath];
    [Name_Label_Shape_Layer setFillRule:kCAFillRuleEvenOdd];
    Name_Label.layer.mask = Name_Label_Shape_Layer;
}
@end
