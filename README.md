# CYPlayer


这款播放器和程序员本身一样，都在默默地发光！


## 通过cocoapods安装播放器到项目

```
pod 'CYPlayer'
```

## 播放器基本特性

- [x] 1.支持动态帧率控制，适配各种性能的机型，最高支持1080p@60fps;
- [x] 2.动态内存控制，适配小内存的iPhone，防止在老设备crash；
- [x] 3.支持RTMP和HLS，轻度支持Samba（CYFFmpeg编入了Samba库）;
- [x] 4.拿来可用，带控制交互界面，可自定义；
- [x] 5.音频采用Sonic优化，支持倍速播放；
- [x] 6.解码核心FFmpeg3.4，x264。



## 示例动图


![prew-1.gif](https://raw.githubusercontent.com/yellowei/CYPlayer/master/prew-1.gif)

![prew-2.gif](https://raw.githubusercontent.com/yellowei/CYPlayer/master/prew-2.gif)


## 简单的代码

```Objective-C

    //创建实例
    CYFFmpegPlayer * vc = [CYFFmpegPlayer movieViewWithContentPath:path parameters:parameters];
    [vc settingPlayer:^(CYVideoPlayerSettings *settings) {
        //设置可选的清晰度
        settings.definitionTypes = CYFFmpegPlayerDefinitionLLD | CYFFmpegPlayerDefinitionLHD | CYFFmpegPlayerDefinitionLSD | CYFFmpegPlayerDefinitionLUD;
        settings.enableSelections = YES;
        settings.setCurrentSelectionsIndex = ^NSInteger{
            return 3;//设定当前播放到了第四节
        };
        settings.nextAutoPlaySelectionsPath = ^NSString *{
            return @"http:/www.yellowei.com/9f76b359339f4bbc919f35e39e55eed4/efa9514952ef5e242a4dfa4ee98765fb-ld.mp4";
        };
        settings.useHWDecompressor = YES;
        //settings.enableProgressControl = NO;
    }];
    //设置代理
    vc.delegate = self;
    //开启自动播放
    vc.autoplay = YES;
    //开启生成预览图功能
    vc.generatPreviewImages = YES;
    //将播放器加到视图
    [contentView addSubview:vc.view];
    
    //通过masonry设置动态适配（约束，autolayout）
    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        if (kiPad)
        {
            make.center.offset(0);
            make.leading.trailing.offset(0);
            make.height.equalTo(vc.view.mas_width).multipliedBy(9.0 / 16.0);
        }
        else
        {
            make.center.offset(0);
            make.top.bottom.offset(0);
            make.width.equalTo(vc.view.mas_height).multipliedBy(16.0 / 9.0);
        }
    }];
    
    
     __weak __typeof(&*self)weakSelf = self;
    vc.lockscreen = ^(BOOL isLock) {
        if (isLock)
        {
            [weakSelf lockRotation];
        }
        else
        {
            [weakSelf unlockRotation];
        }
    };
```

## 注意

```
pod安装CYPlayer后,如果遇到xcode无法调试的问题

请到xocde工程Pod目录下CYPlayer找到"Support Files/CYPlayer.xcconfig"文件

删除OTHER_LDFLAGS中的-read_only_relocs suppress, 尝试真机能否运行
```



## 关于解码动态库CYFFmpeg

- [x] CYFFmpeg可以通过CocoaPods进行安装
- [x] 构建为动态库版本
- [x] 支持Samba协议，线程优化
- [x] 基于ffmpeg 3.4  


[CYFFmpeg-基于ffmpeg的iOS动态库](https://github.com/yellowei/CYFFmpeg)



## 相关阅读


[《iOS中基于ffmpeg开发的播放器打开多个samba链接的解决方案》](https://www.jianshu.com/p/2838b9ddecaf)

[《ffmpeg中samba网络协议的兼容分析(一)》](https://www.jianshu.com/p/ada84499f386)

[《ffmpeg中samba网络协议的兼容分析(一)》](https://www.jianshu.com/p/06b5794a7213)

[《ffmpeg中samba网络协议的兼容分析(一)》](https://www.jianshu.com/p/ada84499f386)


