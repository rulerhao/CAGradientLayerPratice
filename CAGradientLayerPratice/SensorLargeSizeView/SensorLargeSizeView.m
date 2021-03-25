//
//  SensorLargeSizeView.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/22.
//

#import "SensorLargeSizeView.h"
#import "SensorLargeSizeViewSetting.h"
#import <Masonry.h>
@interface SensorLargeSizeView ()
{
    SensorLargeSizeViewSetting *sensorLargeSizeViewSetting;
}
@property (strong, nonatomic) UIView *Content_View;

@property (strong, nonatomic) UIImageView *One_Person_Background_ImageView;

@property (strong, nonatomic) UIImageView *Baby_Image_ImageView;

@property (strong, nonatomic) UIImageView *Baby_Image_Mask_ImageView;

@property (strong, nonatomic) UIImageView *Baby_Breath_Status_ImageView;
@property (strong, nonatomic) UILabel *Baby_Temperature_Label;
@property (strong, nonatomic) UIImageView *Sensor_Battery_Volume_Label;

@property (strong, nonatomic) UILabel *Breath_Status_Title_Label;
@property (strong, nonatomic) UILabel *Temperature_Title_Label;
@property (strong, nonatomic) UILabel *Battery_Title_Label;

@property (strong, nonatomic) UICollectionView *CollectionView;

@end

@implementation SensorLargeSizeView

- (void) entranceMethod : (UIView *) Content_View {
    sensorLargeSizeViewSetting = [[SensorLargeSizeViewSetting alloc] init];
    
    self.Content_View = Content_View;
    
    [self viewInit];
    
    [self updateConstraints];

    [self writeLayers];
    
    NSLog(@"self.One_Person_Background_ImageView.bounds.size.height = %f", self.One_Person_Background_ImageView.bounds.size.height);
    NSLog(@"self.One_Person_Background_ImageView.bounds.size.width = %f", self.One_Person_Background_ImageView.bounds.size.width);
    
    NSLog(@"self.Baby_Image_ImageView.bounds.size.height = %f", self.Baby_Image_ImageView.bounds.size.height);
    NSLog(@"self.Baby_Image_ImageView.bounds.size.width = %f", self.Baby_Image_ImageView.bounds.size.width);
}

- (void) viewInit {
    
    //--------------------- Person Background ImageView -----------------------
    self.One_Person_Background_ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MUL OUcare_09 1-person base.png"]];
    [self.One_Person_Background_ImageView setFrame:CGRectZero];
//    [self.One_Person_Background_ImageView setBackgroundColor:[UIColor blueColor]];
    [self.Content_View addSubview:self.One_Person_Background_ImageView];
    
    //--------------------- Baby Image ImageView -----------------------
    self.Baby_Image_ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shutterstock_1351910084.jpg"]];
    [self.Baby_Image_ImageView setFrame:CGRectZero];
    [self.Baby_Image_ImageView setBackgroundColor:[UIColor redColor]];
    [self.Content_View addSubview:self.Baby_Image_ImageView];
    // TODO: 算法需要修正 否則圖片的Scale會異常
    
    //--------------------- Baby Image Mask ImageView -----------------------
    self.Baby_Image_Mask_ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MUL OUcare_09 1-person base.png"]];
    [self.Baby_Image_Mask_ImageView setFrame:CGRectZero];
//    [self.Baby_Image_Mask_ImageView setBackgroundColor:[UIColor blueColor]];
    [self.Content_View addSubview:self.Baby_Image_Mask_ImageView];
    
    //--------------------- Breath Status ImageView -----------------------
    self.Baby_Breath_Status_ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MUL OUcare_07 green.png"]];
    [self.Baby_Breath_Status_ImageView setFrame:CGRectZero];
//    [self.Baby_Breath_Status_ImageView setBackgroundColor:[UIColor blueColor]];
    [self.Content_View addSubview:self.Baby_Breath_Status_ImageView];
    
    //--------------------- Temperature Label -----------------------
    self.Baby_Temperature_Label = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.Baby_Temperature_Label setText:[NSString stringWithFormat:@"%.1f%@", 36.5, @"℃"]];
    [self.Baby_Temperature_Label setFont:[UIFont fontWithName:@"Helvetica" size:35]];
    [self.Baby_Temperature_Label setBackgroundColor:[UIColor blueColor]];
    [self.Content_View addSubview:self.Baby_Temperature_Label];
    
    //--------------------- Sensor Battery Volume ImageView -----------------------
    self.Sensor_Battery_Volume_Label = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MUL OUcare_08 battery.png"]];
    [self.Sensor_Battery_Volume_Label setFrame:CGRectZero];
//    [self.Sensor_Battery_Volume_Label setBackgroundColor:[UIColor blueColor]];
    [self.Content_View addSubview:self.Sensor_Battery_Volume_Label];
    
    //--------------------- Breath_Status_Title_Label -----------------------
    self.Breath_Status_Title_Label = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.Breath_Status_Title_Label setText:@"Breathing\nMovement"];
    [self.Breath_Status_Title_Label setLineBreakMode:NSLineBreakByWordWrapping];
    [self.Breath_Status_Title_Label setNumberOfLines:0];
    [self.Breath_Status_Title_Label setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [self.Content_View addSubview:self.Breath_Status_Title_Label];
    
    //--------------------- Temperature_Title_Label -----------------------
    self.Temperature_Title_Label = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.Temperature_Title_Label setText:@"Temperature"];
    [self.Temperature_Title_Label setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [self.Content_View addSubview:self.Temperature_Title_Label];
    
    //--------------------- Battery_Title_Label -----------------------
    self.Battery_Title_Label = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.Battery_Title_Label setText:@"Battery"];
    [self.Battery_Title_Label setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [self.Content_View addSubview:self.Battery_Title_Label];
    
    //--------------------- Collection View -----------------------
    UICollectionViewFlowLayout *CollectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    CollectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.CollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:CollectionViewFlowLayout];
    [self.CollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewIdentifier"];
    self.CollectionView.delegate = self.delegate;
    self.CollectionView.dataSource = self.delegate;
    self.CollectionView.backgroundColor = [UIColor clearColor];
    
    UIPinchGestureRecognizer *gesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(didReceivePinchGesture:)];
    [self.CollectionView addGestureRecognizer:gesture];
    
    [self.One_Person_Background_ImageView addSubview: self.CollectionView];
}

- (void) updateConstraints {
    UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
    
    CGSize Whole_View_Size = CGSizeMake(window.screen.bounds.size.width, window.screen.bounds.size.height);
    CGSize Safe_View_Size = CGSizeMake(window.safeAreaLayoutGuide.layoutFrame.size.width, window.safeAreaLayoutGuide.layoutFrame.size.height);

    [super updateConstraints];
    //--------------------- Person Background ImageView -----------------------
    [self.One_Person_Background_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.Content_View.mas_centerY);
        make.centerX.equalTo(self.Content_View.mas_centerX);
        make.width.equalTo(self.Content_View.mas_width).multipliedBy(sensorLargeSizeViewSetting.Ratio_Card_To_Content);
        make.height.equalTo(self.One_Person_Background_ImageView.mas_width).multipliedBy(self.One_Person_Background_ImageView.image.size.height / self.One_Person_Background_ImageView.image.size.width);
    }];
    
    //--------------------- Baby Image ImageView -----------------------
    float Baby_Image_View_Y = Whole_View_Size.width * 0.92 * 3.0 / 133.0;
    [self.Baby_Image_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.One_Person_Background_ImageView.mas_top).offset(Baby_Image_View_Y);
        make.centerX.equalTo(self.One_Person_Background_ImageView.mas_centerX);
        make.width.equalTo(self.One_Person_Background_ImageView.mas_width).multipliedBy(sensorLargeSizeViewSetting.Photo_Width_Multi);
        make.height.equalTo(self.Baby_Image_ImageView.mas_width).multipliedBy(sensorLargeSizeViewSetting.Photo_Width_To_Height_Multi);
    }];
    
    //--------------------- Baby Image Mask ImageView -----------------------
    [self.Baby_Image_Mask_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.One_Person_Background_ImageView.mas_centerY);
        make.centerX.equalTo(self.One_Person_Background_ImageView.mas_centerX);
        make.width.equalTo(self.One_Person_Background_ImageView.mas_width);
        make.height.equalTo(self.One_Person_Background_ImageView.mas_height);
    }];
    
    //--------------------- Breath Status ImageView -----------------------
    [self.Baby_Breath_Status_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Baby_Image_ImageView.mas_bottom).offset(sensorLargeSizeViewSetting.Breath_Status_Top_Distance);
        make.left.equalTo(self.One_Person_Background_ImageView.mas_left).offset(sensorLargeSizeViewSetting.Status_Left_Distance);
        make.right.equalTo(self.Baby_Breath_Status_ImageView.mas_left).offset(sensorLargeSizeViewSetting.Breath_Status_Width);
        make.bottom.equalTo(self.Baby_Breath_Status_ImageView.mas_top).offset(sensorLargeSizeViewSetting.Breath_Status_Width);
    }];
    
    //--------------------- Temperature Label -----------------------
    [self.Baby_Temperature_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Baby_Image_ImageView.mas_bottom).offset(sensorLargeSizeViewSetting.Temperature_Top_Distance);
        make.left.equalTo(self.One_Person_Background_ImageView.mas_left).offset(sensorLargeSizeViewSetting.Status_Left_Distance);
    }];
    
    //--------------------- Sensor Battery Volume Label -----------------------
    [self.Sensor_Battery_Volume_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Baby_Image_ImageView.mas_bottom).offset(sensorLargeSizeViewSetting.Battery_ImageView_Top_Distance);
        make.left.equalTo(self.One_Person_Background_ImageView.mas_left).offset(sensorLargeSizeViewSetting.Status_Left_Distance);
        make.right.equalTo(self.Sensor_Battery_Volume_Label.mas_left).offset(sensorLargeSizeViewSetting.Battery_ImageView_Width);
        make.bottom.equalTo(self.Sensor_Battery_Volume_Label.mas_top).offset(sensorLargeSizeViewSetting.Battery_ImageView_Height);
    }];
    
    //--------------------- Breath_Status_Title_Label -----------------------
    [self.Breath_Status_Title_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Baby_Image_ImageView.mas_bottom).offset(10);
        make.left.equalTo(self.One_Person_Background_ImageView.mas_left).offset(10);
    }];
    //--------------------- Temperature_Title_Label -----------------------
    [self.Temperature_Title_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Baby_Image_ImageView.mas_bottom).offset(100);
        make.left.equalTo(self.One_Person_Background_ImageView.mas_left).offset(10);
    }];
    //--------------------- Battery_Title_Label -----------------------
    [self.Battery_Title_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Baby_Image_ImageView.mas_bottom).offset(190);
        make.left.equalTo(self.One_Person_Background_ImageView.mas_left).offset(10);
    }];
    
    //--------------------- Collection View -----------------------
    [self.CollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.One_Person_Background_ImageView.mas_top);
        make.bottom.equalTo(self.One_Person_Background_ImageView.mas_bottom);
        make.left.equalTo(self.One_Person_Background_ImageView.mas_left);
        make.right.equalTo(self.One_Person_Background_ImageView.mas_right);
    }];
    
    [self.Content_View layoutIfNeeded];
}

- (UICollectionViewCell *) getInitCell : (UICollectionViewCell *) Cell{
    UIImageView *Background_ImageView;
    UIImageView *Baby_Photo_Background_ImageView;
    UITextView *Serial_TextView;
    UITextView *Baby_Name_TextView;
    
    UIImageView *Baby_Information_Bar1_ImageView;
    UIImageView *Baby_Information_Bar2_ImageView;
    UIImageView *Baby_Information_Bar3_ImageView;
    
    UITextView *Movement_TextView;
    UITextView *Temperature_TextView;
    UITextView *Battery_TextView;
    
    //--------------------- Background ImageVIew -----------------------
    Background_ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baby_card_background.png"]];
    Background_ImageView.tag = 1;
    [Cell addSubview:Background_ImageView];
    
    //--------------------- Baby Photo Background ImageView -----------------------
    Baby_Photo_Background_ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baby_card_boy_photo_background2.png"]];
    Baby_Photo_Background_ImageView.tag = 2;
    [Cell addSubview:Baby_Photo_Background_ImageView];
    
    //--------------------- Serial TextView -----------------------
    Serial_TextView = [[UITextView alloc] init];
    Serial_TextView.text = @"0";
    Serial_TextView.scrollEnabled = NO;
    Serial_TextView.editable = NO;
    Serial_TextView.backgroundColor = [UIColor clearColor];
    Serial_TextView.textAlignment = NSTextAlignmentCenter;
    Serial_TextView.tag = 4;
    [Cell addSubview:Serial_TextView];
    
    //--------------------- Baby Name TextView -----------------------
    Baby_Name_TextView = [[UITextView alloc] init];
    Baby_Name_TextView.text = @"Fan";
    Baby_Name_TextView.scrollEnabled = NO;
    Baby_Name_TextView.editable = NO;
    Baby_Name_TextView.tag = 8;
    [Cell addSubview:Baby_Name_TextView];
    
    //--------------------- Information Bar -----------------------
    Baby_Information_Bar1_ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baby_card_boy_information_bar_background.png"]];
    Baby_Information_Bar2_ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baby_card_boy_information_bar_background.png"]];
    Baby_Information_Bar3_ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baby_card_boy_information_bar_background.png"]];
    Baby_Information_Bar1_ImageView.tag = 9;
    Baby_Information_Bar2_ImageView.tag = 10;
    Baby_Information_Bar3_ImageView.tag = 11;
    [Cell addSubview:Baby_Information_Bar1_ImageView];
    [Cell addSubview:Baby_Information_Bar2_ImageView];
    [Cell addSubview:Baby_Information_Bar3_ImageView];
    
    //--------------------- Movement TextView -----------------------
    Movement_TextView = [[UITextView alloc] init];
    Movement_TextView.text = @"0";
    Movement_TextView.scrollEnabled = NO;
    Movement_TextView.editable = NO;
    Movement_TextView.backgroundColor = [UIColor clearColor];
    Movement_TextView.textAlignment = NSTextAlignmentCenter;
    [Movement_TextView setTag:5];
    [Cell addSubview:Movement_TextView];
    
    //--------------------- Temperature TextView -----------------------
    Temperature_TextView = [[UITextView alloc] init];
    Temperature_TextView.text = @"0";
    Temperature_TextView.scrollEnabled = NO;
    Temperature_TextView.editable = NO;
    Temperature_TextView.backgroundColor = [UIColor clearColor];
    Temperature_TextView.textAlignment = NSTextAlignmentCenter;
    [Temperature_TextView setTag:6];
    [Cell addSubview:Temperature_TextView];
    
    //--------------------- Battery TextView -----------------------
    Battery_TextView = [[UITextView alloc] init];
    Battery_TextView.text = @"0";
    Battery_TextView.scrollEnabled = NO;
    Battery_TextView.editable = NO;
    Battery_TextView.backgroundColor = [UIColor clearColor];
    Battery_TextView.textAlignment = NSTextAlignmentCenter;
    [Battery_TextView setTag:7];
    [Cell addSubview:Battery_TextView];
    
    //--------------------- Constraint -----------------------
    //--------------------- Background ImageVIew -----------------------
//    [Background_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(Cell.mas_top);
//        make.bottom.equalTo(Cell.mas_bottom);
//        make.left.equalTo(Cell.mas_left);
//        make.right.equalTo(Cell.mas_right);
//    }];
//    //--------------------- Baby Photo Background ImageView -----------------------
//    [Baby_Photo_Background_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(Background_ImageView.mas_top).offset(sensor4310Setting.Baby_Card_Boy_Photo_Background_Top_Constraint);
//        make.bottom.equalTo(Background_ImageView.mas_top).offset(sensor4310Setting.Baby_Card_Boy_Photo_Background_Bottom_Constraint);
//        make.left.equalTo(Background_ImageView.mas_left).offset(sensor4310Setting.Baby_Card_Boy_Photo_Background_Left_Constraint);
//        make.right.equalTo(Background_ImageView.mas_left).offset(sensor4310Setting.Baby_Card_Boy_Photo_Background_Right_Constraint);
//    }];
//
//    //--------------------- Serial TextView -----------------------
//    [Serial_TextView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(Baby_Photo_Background_ImageView.mas_top);
//        make.bottom.equalTo(Baby_Photo_Background_ImageView.mas_bottom);
//        make.left.equalTo(Baby_Photo_Background_ImageView.mas_left);
//        make.right.equalTo(Baby_Photo_Background_ImageView.mas_right);
//    }];
//
//    //--------------------- Information Bar -----------------------
//    [Baby_Information_Bar3_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(Background_ImageView.mas_bottom).offset(sensor4310Setting.Baby_Card_Boy_Information_Bar3_Top_Constraint);
//        make.bottom.equalTo(Background_ImageView.mas_bottom).offset(sensor4310Setting.Baby_Card_Boy_Information_Bar3_Bottom_Constraint);
//        make.left.equalTo(Background_ImageView.mas_left).offset(sensor4310Setting.Baby_Card_Boy_Information_Bar3_Left_Constraint);
//        make.right.equalTo(Background_ImageView.mas_left).offset(sensor4310Setting.Baby_Card_Boy_Information_Bar3_Right_Constraint);
//    }];
//
//    [Baby_Information_Bar2_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(Baby_Information_Bar3_ImageView.mas_top).offset(sensor4310Setting.Baby_Card_Boy_Information_Bar2_Top_Constraint);
//        make.bottom.equalTo(Baby_Information_Bar3_ImageView.mas_top).offset(sensor4310Setting.Baby_Card_Boy_Information_Bar2_Bottom_Constraint);
//        make.left.equalTo(Background_ImageView.mas_left).offset(sensor4310Setting.Baby_Card_Boy_Information_Bar2_Left_Constraint);
//        make.right.equalTo(Background_ImageView.mas_left).offset(sensor4310Setting.Baby_Card_Boy_Information_Bar2_Right_Constraint);
//    }];
//
//    [Baby_Information_Bar1_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(Baby_Information_Bar2_ImageView.mas_top).offset(sensor4310Setting.Baby_Card_Boy_Information_Bar1_Top_Constraint);
//        make.bottom.equalTo(Baby_Information_Bar2_ImageView.mas_top).offset(sensor4310Setting.Baby_Card_Boy_Information_Bar1_Bottom_Constraint);
//        make.left.equalTo(Background_ImageView.mas_left).offset(sensor4310Setting.Baby_Card_Boy_Information_Bar1_Left_Constraint);
//        make.right.equalTo(Background_ImageView.mas_left).offset(sensor4310Setting.Baby_Card_Boy_Information_Bar1_Right_Constraint);
//    }];
//
//    //--------------------- Movement TextView -----------------------
//    [Movement_TextView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(Baby_Information_Bar1_ImageView.mas_top);
//        make.bottom.equalTo(Baby_Information_Bar1_ImageView.mas_bottom);
//        make.left.equalTo(Baby_Information_Bar1_ImageView.mas_centerX);
//        make.right.equalTo(Baby_Information_Bar1_ImageView.mas_right);
//    }];
//
//    //--------------------- Temperature TextView -----------------------
//    [Temperature_TextView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(Baby_Information_Bar2_ImageView.mas_top);
//        make.bottom.equalTo(Baby_Information_Bar2_ImageView.mas_bottom);
//        make.left.equalTo(Baby_Information_Bar2_ImageView.mas_centerX);
//        make.right.equalTo(Baby_Information_Bar2_ImageView.mas_right);
//    }];
//
//    //--------------------- Battery TextView -----------------------
//    [Battery_TextView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(Baby_Information_Bar3_ImageView.mas_top);
//        make.bottom.equalTo(Baby_Information_Bar3_ImageView.mas_bottom);
//        make.left.equalTo(Baby_Information_Bar3_ImageView.mas_centerX);
//        make.right.equalTo(Baby_Information_Bar3_ImageView.mas_right);
//    }];
    
    return Cell;
}

- (void) writeLayers {
    CAShapeLayer *Baby_Image_Mask_Shape_Layer = [[CAShapeLayer alloc] init];
    
    UIBezierPath *Baby_Image_Mask_Path1 = [[UIBezierPath alloc] init];
    Baby_Image_Mask_Path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(sensorLargeSizeViewSetting.Baby_Image_Elipstic_X,
                                                              sensorLargeSizeViewSetting.Baby_Image_Elipstic_Y,
                                                              sensorLargeSizeViewSetting.Baby_Image_Elipstic_Width,
                                                              sensorLargeSizeViewSetting.Baby_Image_Elipstic_Height)];
    
    UIBezierPath *Baby_Image_Mask_Path2 = [[UIBezierPath alloc] init];
    Baby_Image_Mask_Path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(sensorLargeSizeViewSetting.Baby_Image_Rect_X,
                                                               sensorLargeSizeViewSetting.Baby_Image_Rect_Y,
                                                               sensorLargeSizeViewSetting.Baby_Image_Rect_Width,
                                                               sensorLargeSizeViewSetting.Baby_Image_Rect_Height) cornerRadius:sensorLargeSizeViewSetting.Baby_Image_Rect_Height_Corner_Radius];
    [Baby_Image_Mask_Path1 appendPath:Baby_Image_Mask_Path2];
    
    [Baby_Image_Mask_Shape_Layer setPath:Baby_Image_Mask_Path1.CGPath];
    [Baby_Image_Mask_Shape_Layer setFillRule:kCAFillRuleEvenOdd];
    self.Baby_Image_Mask_ImageView.layer.mask = Baby_Image_Mask_Shape_Layer;
    
    // Photo
    CAShapeLayer *Baby_Image_Shape_Layer = [[CAShapeLayer alloc] init];
    
    UIBezierPath *Baby_Photo_Path1 = [[UIBezierPath alloc] init];
    Baby_Photo_Path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(sensorLargeSizeViewSetting.Baby_Photo_X,
                                                               sensorLargeSizeViewSetting.Baby_Photo_Y,
                                                               sensorLargeSizeViewSetting.Baby_Image_Rect_Width,
                                                               sensorLargeSizeViewSetting.Baby_Image_Rect_Height) cornerRadius:sensorLargeSizeViewSetting.Baby_Image_Rect_Height_Corner_Radius];
    [Baby_Image_Shape_Layer setPath:Baby_Photo_Path1.CGPath];
    [Baby_Image_Shape_Layer setFillRule:kCAFillRuleEvenOdd];
    self.Baby_Image_ImageView.layer.mask = Baby_Image_Shape_Layer;
    
    //--------------------- Breath_Status_Title_Label -----------------------
    [self uiLabelWriteBottomBorder:self.Breath_Status_Title_Label];
    //--------------------- Temperature_Title_Label -----------------------
    [self uiLabelWriteBottomBorder:self.Temperature_Title_Label];
    //--------------------- Battery_Title_Label -----------------------
    [self uiLabelWriteBottomBorder:self.Battery_Title_Label];
    
}

#pragma mark - METHOD
- (void) uiLabelWriteBottomBorder : (UILabel *) Label {
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.borderColor = [UIColor blackColor].CGColor;
    bottomBorder.borderWidth = 1;
    bottomBorder.frame = CGRectMake(0, CGRectGetHeight(Label.frame)-1, CGRectGetWidth(Label.frame), 1);
    Label.clipsToBounds = YES;
    [Label.layer addSublayer:bottomBorder];
}
@end
