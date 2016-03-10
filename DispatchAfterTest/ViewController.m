//
//  ViewController.m
//  DispatchAfterTest
//
//  Created by Longcai on 16/3/10.
//  Copyright (c) 2016年 Longcai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *v1;
@property (weak, nonatomic) IBOutlet UIView *v2;
@property (weak, nonatomic) IBOutlet UIView *v3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _v1.tag = 1001;
    _v2.tag = 1002;
    _v3.tag = 1003;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    for (int i=0; i<3; i++) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((i+1) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:10 animations:^{
                
                UIView * view = (UIView *)[self.view viewWithTag:1001+i];
                
                view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width+100, view.frame.size.height);
            }];
        });
    }
}

@end
