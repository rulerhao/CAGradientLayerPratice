//
//  TitleBarViewController.m
//  CAGradientLayerPratice
//
//  Created by louie on 2021/3/23.
//

#import "TitleBarViewController.h"
#import "TitleBarModel.h"
#import <Masonry.h>
#import "GradientBackgroundView.h"
@interface TitleBarViewController ()
@property (strong, nonatomic) TitleBarView *titleBarView;
@end

@implementation TitleBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    BackgroundView *backgroundView = [BackgroundView alloc];
//    [backgroundView entranceMethod:self.view];
//    self.view.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:self.titleBarView];
//    [self.view viewWithTag:1];
}

- (void) initView {
    self.titleBarView = [TitleBarView alloc];
    self.titleBarView.delegate = self;
    [self.titleBarView entranceMethod:self.view];
}

- (void) updateConstraints {
    
}

- (void)titleButtonBeClicked:(UIButton *)Sender {
    float Animate_Time = 0.3;
    float Button_Label_Bigger_Size = 1.4;
    float Button_Line_View_Smaller_Size = 0.01;
    if(Sender == [self.titleBarView.Button_Array_List objectAtIndex:LeftButtonIndex]) {
        NSLog(@"Left Button Be Clicked");
        [UIView animateWithDuration:Animate_Time animations:^{
            [self.titleBarView.Button_Label_Array_List objectAtIndex:LeftButtonIndex].transform = CGAffineTransformScale(Sender.transform, Button_Label_Bigger_Size, Button_Label_Bigger_Size);
            [self.titleBarView.Button_Label_Array_List objectAtIndex:RightButtonIndex].transform = CGAffineTransformScale(Sender.transform, 1, 1);
            [self.titleBarView.Button_Line_View_Array_List objectAtIndex:LeftButtonIndex].transform = CGAffineTransformScale(Sender.transform, 1, 1);
            [self.titleBarView.Button_Line_View_Array_List objectAtIndex:RightButtonIndex].transform = CGAffineTransformScale(Sender.transform, Button_Line_View_Smaller_Size, Button_Line_View_Smaller_Size);
        }];
    }
    else if(Sender == [self.titleBarView.Button_Array_List objectAtIndex:RightButtonIndex]) {
        NSLog(@"Right Button Be Clicked");
        [UIView animateWithDuration:Animate_Time animations:^{
            [self.titleBarView.Button_Label_Array_List objectAtIndex:LeftButtonIndex].transform = CGAffineTransformScale(Sender.transform, 1, 1);
            [self.titleBarView.Button_Label_Array_List objectAtIndex:RightButtonIndex].transform = CGAffineTransformScale(Sender.transform, Button_Label_Bigger_Size, Button_Label_Bigger_Size);
            [self.titleBarView.Button_Line_View_Array_List objectAtIndex:LeftButtonIndex].transform = CGAffineTransformScale(Sender.transform, Button_Line_View_Smaller_Size, Button_Line_View_Smaller_Size);
            [self.titleBarView.Button_Line_View_Array_List objectAtIndex:RightButtonIndex].transform = CGAffineTransformScale(Sender.transform, 1, 1);
            
        }];
    }
}
@end
