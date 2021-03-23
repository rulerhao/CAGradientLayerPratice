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
typedef NS_ENUM(NSInteger, FunctionButtonEnum) {
    ButtonHaveNotThing = -1,
    SensorController = 1,
    RegisterController = 2
};

- (void) entranceMethod : (UIView *) Content_View {
    self.Content_View = Content_View;
    self.Button_Array_List = [[NSMutableArray alloc] init];
    
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
        [button setTitle:Title_String forState:UIControlStateNormal];
        [button setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
//        [button setBackgroundColor:[UIColor yellowColor]];
        [self.Button_Array_List addObject:button];
        [self.Content_View addSubview:button];
    }
}

- (void) updateConstraints {
    [super updateConstraints];
    
    //--------------------- Log In Title Label -----------------------
    UIButton *Left_Button = [UIButton alloc];
    Left_Button = [self.Button_Array_List objectAtIndex:0];
    NSLog(@"Left_Button = %@", Left_Button);
    [Left_Button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Content_View.mas_top);
        make.height.equalTo(self.Content_View.mas_height).multipliedBy(14.0/18.0);
        make.left.equalTo(self.Content_View.mas_safeAreaLayoutGuideLeft);
        make.width.equalTo(self.Content_View.mas_width).multipliedBy(0.5);
    }];
    
    UIButton *Right_Button = [UIButton alloc];
    Right_Button = [self.Button_Array_List objectAtIndex:1];
    
    [Right_Button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Content_View.mas_top);
        make.height.equalTo(self.Content_View.mas_height).multipliedBy(14.0/18.0);
        make.width.equalTo(self.Content_View.mas_width).multipliedBy(0.5);
        make.right.equalTo(self.Content_View.mas_safeAreaLayoutGuideRight);
    }];
    
    //[self.Content_View layoutIfNeeded];
}

- (void) writeLayers {
}
@end
