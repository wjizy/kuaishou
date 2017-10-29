模仿快手app的直播项目

1、集成ijkPlayer  这里面是直接使用framework

注意的点：集成的ijkPlayer 的时候先使用 里面的命令行
相关命令行：cd /Users/jinfeng/Downloads/ijkplayer-master
调到这个文件夹下面 然后执行shell文件 下载ffmpeg库，这个播放器是基于这个开源库写的
./init-ios.sh
下载完成之后
cd ios
./compile-ffmpeg.sh clean 清空ffmpeg库下面的文件 为ffmpeg编译做准备
./compile-ffmpeg.sh all 真正的编译各个平台的ffmpeg库，并生成所以平台的通用库. 需要等待很长一段时间

之后demo就可以跑通了  之后再合并framework
lipo -create "真机版本路径" "模拟器版本路径" -output "合并后的文件路径"
之后直接使用合并之后的framework

致此，基本完成IJKPlayer的集成合并
