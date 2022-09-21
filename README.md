# slam14ch2cmakelists
![图片](https://user-images.githubusercontent.com/59297917/191453106-d09bcc14-2f0c-4f6a-a307-15c587e9a60f.png)
本层的makefile只对应本层的makefile  而且注意，build内部的目录层级和project下面的目录层级也是一一对应的，所以默认一旦有add_subdirectory(src)那么在build下面也会默认生成一个src，而add_subdirectory(src out)只是把默认的src目录重命名为out，目录层级还是一一对应
