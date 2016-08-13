//
//  ViewController.m
//  1-layer
//
//  Created by shadandan on 16/8/13.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *redView=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor=[UIColor redColor];
    [self.view addSubview:redView];
    
    //内边框
    redView.layer.borderWidth=10;//边框宽度
    redView.layer.borderColor=[UIColor whiteColor].CGColor;//borderColor的类型是CGColorRef C语言类型的color，所以要将OC的color转化为C语言的color，在后边.CGColor
    //阴影
    redView.layer.shadowOffset=CGSizeMake(50, 50);
    redView.layer.shadowColor=[UIColor blueColor].CGColor;
    redView.layer.shadowOpacity=1;//透明度，如果想讲阴影显示出来必须设置透明度
    redView.layer.shadowRadius=50;//设置圆角半径
    //圆角
    redView.layer.cornerRadius=50;//
    redView.layer.masksToBounds=YES;//把其余部分切掉为YES，相当于clipToBounds属性设置为YES
    //bounds设置大小,frame设置大小就是通过bounds设置的
    redView.layer.bounds=CGRectMake(0, 0, 200, 200);
    
    //position默认相当于设置view的center
    redView.layer.position=CGPointMake(100, 100);
    //设置内容（图片）
    redView.layer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"icon"].CGImage);//contents应该是一个id类型的，实际上是一个C的CGImageRef类型的，所以要转化一下.CGImage，还要强转成OC的id类型
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
