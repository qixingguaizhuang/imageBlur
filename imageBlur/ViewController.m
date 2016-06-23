//
//  ViewController.m
//  imageBlur
//
//  Created by sp on 16/6/23.
//  Copyright © 2016年 宋平. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageEffects.h"

@interface ViewController ()

@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UIImageView *imageY;

@property (nonatomic, strong)UIImage *imageGrap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
    UIImage *image = [UIImage imageNamed:@"cat"];
    self.imageV.image = [image applyLightEffect];
    [self.view addSubview:self.imageV];
    
    
    
    self.imageY = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, self.imageV.frame.size.width - 40, self.imageV.frame.size.height - 80 )];
    
    UIImage *image2 = [UIImage imageNamed:@"cat"];
    
    [self.imageY setImage:image2];
    //    self.imageV.image2 = [image applyDarkEffect];
    [self.view addSubview:self.imageY];
    
    
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(100, 500, self.view.frame.size.width - 200, 50);
    [button setTitle:@"下载" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(downImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    //高质量图片 “画布”
    UIGraphicsBeginImageContext(CGSizeMake([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height));
    
    // 绘制图片
    [self.imageV.image drawInRect:self.imageV.frame];
    [self.imageY.image drawInRect:self.imageY.frame];
    //获取上下文中的图片
    self.imageGrap = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束上下文
    UIGraphicsEndImageContext();
    
    
    
    
    
}

//下载

- (void)downImage:(UIButton *)button{
    
    UIImageWriteToSavedPhotosAlbum(self.imageGrap , self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
    
}


#pragma mark -- 保存相册协议

- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *message = @"保存";
    
    if (!error) {
        
        NSLog(@"保存成功");
        
        
    }else{
        
        message = [error description];
    }
    
    NSLog(@"message is %@",message);
    
}


@end
