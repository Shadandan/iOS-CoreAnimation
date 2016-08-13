//
//  ViewController.m
//  7-组动画
//
//  Created by shadandan on 16/8/13.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *redView=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 20, 20)];
    redView.backgroundColor=[UIColor redColor];
    [self.view addSubview:redView];
    self.layer=redView.layer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CAAnimationGroup *group=[[CAAnimationGroup alloc]init];
    
    //创建一个关键帧动画实现公转
    CAKeyframeAnimation *keyAnim=[[CAKeyframeAnimation alloc]init];
    keyAnim.keyPath=@"position";
    UIBezierPath *path1=[UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:50 startAngle:0 endAngle:2*M_PI clockwise:YES];
    keyAnim.path=path1.CGPath;
    
    //创建一个基本动画，实现自转
    CABasicAnimation *basicAnim=[[CABasicAnimation alloc]init];
    basicAnim.keyPath=@"transform.rotation";
    basicAnim.byValue=@(2*M_PI*3);
    
    group.animations=@[keyAnim,basicAnim];
    group.duration=2;
    [self.layer addAnimation:group forKey:nil];
}
@end
