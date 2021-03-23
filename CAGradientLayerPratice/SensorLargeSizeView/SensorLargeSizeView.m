//
//  SensorLargeSizeView.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/22.
//

#import "SensorLargeSizeView.h"
#import <Masonry.h>
@interface SensorLargeSizeView ()

@property (strong, nonatomic) UIView *Content_View;

@property (strong, nonatomic) UIImageView *One_Person_Background_ImageView;
@property (strong, nonatomic) UICollectionView *CollectionView;

@end

@implementation SensorLargeSizeView

- (void) entranceMethod : (UIView *) Content_View {
    self.Content_View = Content_View;
    
    [self viewInit];

    [self updateConstraints];

//    [self writeLayers];
}

- (void) viewInit {
    
    //--------------------- Person Background ImageView -----------------------
    self.One_Person_Background_ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MUL OUcare_09 1-person base.png"]];
    [self.One_Person_Background_ImageView setFrame:CGRectZero];
    [self.One_Person_Background_ImageView setBackgroundColor:[UIColor blueColor]];
    [self.Content_View addSubview:self.One_Person_Background_ImageView];
    
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
    [super updateConstraints];
    //--------------------- Person Background ImageView -----------------------
    float Person_Background_Width = self.Content_View.bounds.size.width * 0.92;
    NSLog(@"Width = %f", Person_Background_Width);
    float Person_Background_Height = Person_Background_Width * self.One_Person_Background_ImageView.image.size.height / self.One_Person_Background_ImageView.image.size.width;
    NSLog(@"Height = %f", Person_Background_Height);
    [self.One_Person_Background_ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.Content_View.mas_top);
//        make.bottom.equalTo(self.Content_View.mas_bottom);
//        make.left.equalTo(self.Content_View.mas_left);
//        make.right.equalTo(self.Content_View.mas_right);
//        make.top.equalTo(self.Content_View.mas_top);
//        make.bottom.equalTo(self.Content_View.mas_bottom);
//        make.top.equalTo(self.Content_View.mas_bottom).offset(- Person_Background_Height);
        make.centerY.equalTo(self.Content_View.mas_centerY);
        make.height.equalTo(@(Person_Background_Height));
        make.centerX.equalTo(self.Content_View.mas_centerX);
        make.width.equalTo(self.Content_View.mas_width).multipliedBy(0.92);
    }];
    //--------------------- Collection View -----------------------
    [self.CollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.One_Person_Background_ImageView.mas_top);
        make.bottom.equalTo(self.One_Person_Background_ImageView.mas_bottom);
        make.left.equalTo(self.One_Person_Background_ImageView.mas_left);
        make.right.equalTo(self.One_Person_Background_ImageView.mas_right);
    }];
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
@end
