

Readme:
注意：模型部署测试的时候deploy.prototxt和 caffemodel一定要匹配（来自同“次”测训练模型），防止数据shape不一致所导致的错误。


1. deploy_voc是caffe—SSD 项目提供的caffemodel 和deploy.prototxt
2. deploy_yuuav用的是20180810训练的5W次迭代输出的caffemodel，和其deploy.prototxt文件


步骤：
1. 拷贝caffemodel和deploy文件，还有相应的labelmap文件
2. 修改deploy中的labelmap 路径
3. 将要测试的单张图片放入test_image, 修改执行文件SSD**_deploy.py文件中的测试文件名称。
4. 运行$python SSD**_deploy.py