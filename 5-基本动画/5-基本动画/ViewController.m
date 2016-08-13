//
//  ViewController.m
//  5-基本动画
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
    UIView *redView=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor=[UIColor redColor];
    [self.view addSubview:redView];
    self.layer=redView.layer;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //1.创建动画对象
    //2.动画的操作
    //3.添加到某个layer
    
    //基本动画
    //1.创建动画对象
    CABasicAnimation *anim=[[CABasicAnimation alloc]init];
    //2.动画的操作
    anim.keyPath=@"position.x";//设置要设动画的属性kvc
    anim.fromValue=@(10);//从哪
    anim.toValue=@(300);//到哪
    
    //anim.byValue=@(10);//在自身的基础上累加
    
    //不回到原始位置
    anim.fillMode=kCAFillModeForwards;
    anim.removedOnCompletion=NO;
    
    //3.添加到某个layer
    [self.layer addAnimation:anim forKey:nil];
    
}
@end
