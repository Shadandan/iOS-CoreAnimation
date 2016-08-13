//
//  ViewController.m
//  4-时钟
//
//  Created by shadandan on 16/8/13.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)CALayer *second;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CALayer *clock=[[CALayer alloc]init];
    clock.bounds=CGRectMake(0, 0, 100, 100);
    clock.position=CGPointMake(100, 100);
    clock.cornerRadius=50;
    clock.backgroundColor=[UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:clock];
    CALayer *second=[[CALayer alloc]init];
    second.bounds=CGRectMake(0, 0, 2, 50);
    second.anchorPoint=CGPointMake(0.5, 0.8);
    second.position=CGPointMake(100, 100);
    second.backgroundColor=[UIColor redColor].CGColor;
    [self.view.layer addSublayer:second];
    
    //NSTimer定时器实现1s钟调一次旋转的方法
    //[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    self.second=second;
    
    //CADisplayLink实现,每秒钟刷新调用60次
    CADisplayLink *link=[CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];
    
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    //[self timeChange];//先转到当前时间的角度
}
-(void)timeChange{

    NSDate *date=[NSDate date];
    //获取当前秒数的方法1：
//    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
//    formatter.dateFormat=@"ss";
//    NSString *str=[formatter stringFromDate:date];
//    CGFloat f=[str floatValue];//秒数
    
    //获取当前秒数的方法2：
    NSCalendar *calendar=[NSCalendar currentCalendar];
    CGFloat s=[calendar component:NSCalendarUnitSecond fromDate:date];
    CGFloat ms=[calendar component:NSCalendarUnitNanosecond fromDate:date];
    //NSLog(@"%f",ms);
    CGFloat mAngle=2*M_PI/60/1000000000;
    CGFloat angle=2*M_PI/60;
    CGFloat toAngle=angle*s+mAngle*ms;
    //self.second.affineTransform=CGAffineTransformRotate(self.second.affineTransform, angle);//旋转的角度
    self.second.affineTransform=CGAffineTransformMakeRotation(toAngle);//转到的角度
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
