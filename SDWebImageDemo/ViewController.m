//
//  ViewController.m
//  SDWebImageDemo
//
//  Created by 李俊宇 on 2018/10/25.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)getSize:(id)sender;
- (IBAction)clearMemory:(id)sender;
- (IBAction)loadPic:(id)sender;

@end

@implementation ViewController

static NSString * imageURL = @"http://f.hiphotos.baidu.com/zhidao/pic/item/a5c27d1ed21b0ef486339c21dbc451da80cb3ef1.jpg";
//其他URL：https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1504497742352&di=1d930dcfad527fb80f62e696e4cbd54b&imgtype=0&src=http%3A%2F%2Fpic15.nipic.com%2F20110730%2F7689559_151457143162_2.jpg   http://img.pconline.com.cn/images/upload/upc/tx/photoblog/1510/14/c16/13960684_1444828487538.jpg
- (void)viewDidLoad {
    [super viewDidLoad];
  
}


/*计算当前缓存大小*/
- (IBAction)getSize:(id)sender {
    CGFloat size = [[SDImageCache sharedImageCache] getSize];
    NSLog(@"%f",size);
}
/*清理图片缓存按钮*/
- (IBAction)clearMemory:(id)sender {
    /*
     异步清除所有磁盘缓存映像。非阻塞方法-立即返回。@param完成一个应该在缓存过期后执行的块(可选)
     
     注意:这里要注意[[SDImageCache sharedImageCache] clearDisk];方法会报错，下面clearDiskOnCompletion的方法会替代上面的方法
     */
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        
    }];
    
    /*
     Clear all memory cached images --->清除所有缓存镜像
     */
    [[SDImageCache sharedImageCache] clearMemory];
    
    /*
     异步将所有过期的缓存映像从磁盘中删除。非阻塞方法-立即返回。@param completionBlock在缓存过期后执行(可选)--->故名思义他是不能删除你当前缓存的大小的
     */
    [[SDImageCache sharedImageCache] deleteOldFilesWithCompletionBlock:^{
        
    }];
}

//加载图片
- (IBAction)loadPic:(id)sender {
     [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"lklj"]];
}
@end


