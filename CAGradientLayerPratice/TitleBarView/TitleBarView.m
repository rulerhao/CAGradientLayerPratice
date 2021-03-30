//
//  TitleBarView.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/22.
//

#import "TitleBarView.h"
#import <Masonry.h>
@interface TitleBarView ()

@property (strong, nonatomic) UIView *Content_View;

@end

@implementation TitleBarView

- (void) entranceMethod : (UIView *) Content_View {
    self.Content_View = Content_View;
    self.Button_Array_List = [[NSMutableArray alloc] init];
    self.Button_Label_Array_List = [[NSMutableArray alloc] init];
    self.Button_Line_View_Array_List = [[NSMutableArray alloc] init];
    
    [self viewInit];

    [self updateConstraints];

    [self writeLayers];
}

- (void) viewInit {
    
    //--------------------- Log In Title Label -----------------------
    
    for(int i = 0; i < 2; i++) {
        UIButton *button = [[UIButton alloc] init];
        [button addTarget:self action:@selector(touchedButton:) forControlEvents:UIControlEventTouchUpInside];
        [button setTag:i];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        
        NSString *Title_String;
        switch (i) {
            case 0:
                Title_String = @"Monitor";
                break;
            case 1:
                Title_String = @"Add Device";
                break;
            default:
                break;
        }
        [label setText:Title_String];
        label.textColor = [UIColor whiteColor];
        
        UIView *Line_View = [[UIView alloc] initWithFrame:CGRectZero];
        Line_View.backgroundColor = [UIColor whiteColor];
        
        [self.Button_Array_List addObject:button];
        [self.Button_Label_Array_List addObject:label];
        [self.Button_Line_View_Array_List addObject:Line_View];
        
        [self.Content_View addSubview:button];
        [self.Content_View addSubview:label];
        [self.Content_View addSubview:Line_View];
    }
}

- (void) updateConstraints {
    [super updateConstraints];
    
    //--------------------- Left Button View -----------------------
    UIButton *Left_Button = [UIButton alloc];
    Left_Button = [self.Button_Array_List objectAtIndex:0];
    
    [Left_Button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Content_View.mas_top);
        make.height.equalTo(self.Content_View.mas_height);
        make.left.equalTo(self.Content_View.mas_safeAreaLayoutGuideLeft);
        make.width.equalTo(self.Content_View.mas_width).multipliedBy(0.5);
    }];
    
    UILabel *Left_Button_Text_Label = [self.Button_Label_Array_List objectAtIndex:0];
    [Left_Button_Text_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(Left_Button.mas_centerX);
        make.bottom.equalTo(Left_Button.mas_bottom).multipliedBy(14.0/18.0);
    }];
    
    UIView *Left_Line_View = [self.Button_Line_View_Array_List objectAtIndex:0];
    [Left_Line_View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(Left_Button.mas_bottom).multipliedBy(0.98);
        make.centerX.equalTo(Left_Button.mas_centerX);
        make.width.equalTo(Left_Button.mas_width).multipliedBy(0.6);
        make.height.equalTo(Left_Button.mas_height).multipliedBy(0.02);
    }];
    //--------------------- Right Button View -----------------------
    UIButton *Right_Button = [UIButton alloc];
    Right_Button = [self.Button_Array_List objectAtIndex:1];
    
    [Right_Button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Content_View.mas_top);
        make.height.equalTo(self.Content_View.mas_height);
        make.width.equalTo(self.Content_View.mas_width).multipliedBy(0.5);
        make.right.equalTo(self.Content_View.mas_safeAreaLayoutGuideRight);
    }];
    
    UILabel *Right_Button_Text_Label = [self.Button_Label_Array_List objectAtIndex:1];
    [Right_Button_Text_Label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(Right_Button.mas_centerX);
        make.bottom.equalTo(Right_Button.mas_bottom).multipliedBy(14.0/18.0);
    }];
    
    UIView *Right_Line_View = [self.Button_Line_View_Array_List objectAtIndex:1];
    [Right_Line_View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(Right_Button.mas_bottom).multipliedBy(0.98);
        make.centerX.equalTo(Right_Button.mas_centerX);
        make.width.equalTo(Right_Button.mas_width).multipliedBy(0.6);
        make.height.equalTo(Right_Button.mas_height).multipliedBy(0.02);
    }];
    //[self.Content_View layoutIfNeeded];
}

- (void) writeLayers {
}
- (void) touchedButton : (UIButton *) sender {
    [self.delegate titleButtonBeClicked:sender];
}
@end
