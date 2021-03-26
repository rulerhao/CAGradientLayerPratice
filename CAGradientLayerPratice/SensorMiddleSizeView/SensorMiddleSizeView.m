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
    UILabel *Name_Label;
    
    //--------------------- Background View -----------------------
    Background_View = [[UIView alloc] initWithFrame:CGRectZero];
    Background_View.tag = 1;
    Background_View.backgroundColor = [UIColor yellowColor];
    [Cell addSubview:Background_View];
    
    //--------------------- Bed Nubmer Label -----------------------
    Bed_Nubmer_Label = [[UILabel alloc] initWithFrame:CGRectZero];
    Bed_Nubmer_Label.tag = 2;
    Bed_Nubmer_Label.text = @"Max";
    Bed_Nubmer_Label.font = [UIFont fontWithName:@"Helvetica" size:20];
    Bed_Nubmer_Label.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.6];
    [Cell addSubview:Bed_Nubmer_Label];
    
    //--------------------- Breath Status ImageView -----------------------
    Breath_Status_ImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    Breath_Status_ImageView.tag = 3;
    [Cell addSubview:Breath_Status_ImageView];
    
    //--------------------- Temperature Label -----------------------
    Temperature_Label = [[UILabel alloc] initWithFrame:CGRectZero];
    Temperature_Label.tag = 4;
    [Cell addSubview:Temperature_Label];
    
    //--------------------- Battery Volume ImageView -----------------------
    Battery_Volume_ImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    Battery_Volume_ImageView.tag = 5;
    [Cell addSubview:Battery_Volume_ImageView];
    
    //--------------------- Baby Photo ImageView -----------------------
    Baby_Photo_ImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    Baby_Photo_ImageView.tag = 6;
    Baby_Photo_ImageView.image = [UIImage imageNamed:@"shutterstock_1351910084.jpg"];
    [Cell addSubview:Baby_Photo_ImageView];
    
    //--------------------- Name Label -----------------------
    Name_Label = [[UILabel alloc] initWithFrame:CGRectZero];
    Name_Label.tag = 7;
    [Cell addSubview:Name_Label];
    NSLog(@"END For cellViewInit");
}

// --------- Constraints for collectionView  cell -------------
- (void) cellConstraints : (UICollectionViewCell *) Cell {
    Cell.backgroundColor = [UIColor blueColor];
    UIView *Background_View = [UIView alloc];
    Background_View = [Cell viewWithTag:1];
    UILabel *Bed_Nubmer_Label = [Cell viewWithTag:2];
    UIImageView *Breath_Status_ImageView = [Cell viewWithTag:3];
    UILabel *Temperature_Label = [Cell viewWithTag:4];
    UIImageView *Battery_Volume_ImageView = [Cell viewWithTag:5];
    UIImageView *Baby_Photo_ImageView = [Cell viewWithTag:6];
    UILabel *Name_Label = [Cell viewWithTag:7];
    
    //--------------------- Background View -----------------------
    NSLog(@"self.ContentView = %@", self.Content_View);
    [Background_View mas_updateConstraints:^(MASConstraintMaker *make) {
        NSLog(@"self.ContentView = %@", self.Content_View);
        make.top.equalTo(Cell.mas_top).offset(0);
        make.left.equalTo(Cell.mas_left).offset(0);
        make.width.equalTo(@(sensorMiddleSizeViewSetting.Cell_Width));
        make.height.equalTo(@(sensorMiddleSizeViewSetting.Cell_Height));
    }];
    
    //--------------------- Temperature Label -----------------------
    
    //--------------------- Battery Volume ImageView -----------------------
    
    //--------------------- Baby Photo ImageView -----------------------
    [Baby_Photo_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        NSLog(@"self.ContentView = %@", self.Content_View);
        NSLog(@"Photo X = %f", sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.size.width);
        NSLog(@"Photo Y = %f", sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.size.height);
        make.bottom.equalTo(Cell.mas_bottom).offset(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.origin.x);
        make.left.equalTo(Cell.mas_left).offset(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.origin.y);
        make.width.equalTo(@(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.size.width));
        make.height.equalTo(@(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.size.height));
    }];
    
    //--------------------- Name Label -----------------------
    [Cell layoutIfNeeded];
}

// ------------- Draw for CALayer or CAShapeLayer ------------
- (void) cellWriteLayers : (UICollectionViewCell *) Cell {
    UIView *Background_View = [Cell viewWithTag:1];
    UILabel *Bed_Nubmer_Label = [Cell viewWithTag:2];
    UIImageView *Breath_Status_ImageView = [Cell viewWithTag:3];
    UILabel *Temperature_Label = [Cell viewWithTag:4];
    UIImageView *Battery_Volume_ImageView = [Cell viewWithTag:5];
    UIImageView *Baby_Photo_ImageView = [Cell viewWithTag:6];
    UILabel *Name_Label = [Cell viewWithTag:7];
    
    //--------------------- Background View -----------------------
    CAShapeLayer *Card_Background_Shape_Layer = [[CAShapeLayer alloc] init];
    
    UIBezierPath *Background_Path1 = [[UIBezierPath alloc] init];
    Background_Path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, sensorMiddleSizeViewSetting.Cell_Width, sensorMiddleSizeViewSetting.Cell_Height) cornerRadius:sensorMiddleSizeViewSetting.Cell_Corner_Radius];
    [Card_Background_Shape_Layer setPath:Background_Path1.CGPath];
    [Card_Background_Shape_Layer setFillRule:kCAFillRuleEvenOdd];
    Background_View.layer.mask = Card_Background_Shape_Layer;
    
    /* Set gradient color for card */
    CAGradientLayer *Card_Background_Gradient_Layer = [[CAGradientLayer alloc] init];
    Card_Background_Gradient_Layer.frame = Background_View.bounds;
    Card_Background_Gradient_Layer.colors = sensorMiddleSizeViewSetting.Cell_Background_Gradient_Color;
    Card_Background_Gradient_Layer.startPoint = sensorMiddleSizeViewSetting.Cell_Background_Gradient_Start_Point;
    Card_Background_Gradient_Layer.endPoint = sensorMiddleSizeViewSetting.Cell_Background_Gradient_End_Point;
    [Background_View.layer addSublayer:Card_Background_Gradient_Layer];
    
    //--------------------- Breath Status ImageView -----------------------
    
    //--------------------- Temperature Label -----------------------
    
    //--------------------- Battery Volume ImageView -----------------------
    
    //--------------------- Baby Photo ImageView -----------------------
    CAShapeLayer *Baby_Photo_Mask_Shape_Layer = [[CAShapeLayer alloc] init];

    UIBezierPath *Baby_Photo_Mask_Path1 = [[UIBezierPath alloc] init];
    NSLog(@"sensorMiddleSizeViewSetting.Baby_Photo_Elipstic_Rect.origin.x = %f", sensorMiddleSizeViewSetting.Baby_Photo_Elipstic_Rect.origin.x);
    Baby_Photo_Mask_Path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(sensorMiddleSizeViewSetting.Baby_Photo_Elipstic_Rect.origin.x,
                                                                              sensorMiddleSizeViewSetting.Baby_Photo_Elipstic_Rect.origin.y,
                                                                              sensorMiddleSizeViewSetting.Baby_Photo_Elipstic_Rect.size.width,
                                                                              sensorMiddleSizeViewSetting.Baby_Photo_Elipstic_Rect.size.height)];

    UIBezierPath *Baby_Photo_Mask_Path2 = [[UIBezierPath alloc] init];
    Baby_Photo_Mask_Path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.origin.x,
                                                                               sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.origin.y,
                                                                               sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.size.width,
                                                                               sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.size.height) cornerRadius:sensorMiddleSizeViewSetting.Baby_Photo_Rect_Corner_Radious];
    [Baby_Photo_Mask_Path1 appendPath:Baby_Photo_Mask_Path2];

    [Baby_Photo_Mask_Shape_Layer setPath:Baby_Photo_Mask_Path1.CGPath];
    [Baby_Photo_Mask_Shape_Layer setFillRule:kCAFillRuleEvenOdd];
    Baby_Photo_ImageView.layer.mask = Baby_Photo_Mask_Shape_Layer;
    
    CAShapeLayer *Baby_Photo_Shape_Layer = [[CAShapeLayer alloc] init];

    UIBezierPath *Baby_Photo_Path1 = [[UIBezierPath alloc] init];
    
    Baby_Photo_Path1 = [UIBezierPath bezierPathWithRect:CGRectMake(sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.origin.x,
                                                                   sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.origin.y,
                                                                   sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.size.width,
                                                                   sensorMiddleSizeViewSetting.Baby_Photo_Rect_Rect.size.height)];
    [Baby_Photo_Shape_Layer setPath:Baby_Photo_Path1.CGPath];
    [Baby_Photo_Shape_Layer setFillRule:kCAFillRuleEvenOdd];
//    Baby_Photo_ImageView.layer.mask = Baby_Photo_Shape_Layer;
    
    //--------------------- Name Label -----------------------
}
@end
