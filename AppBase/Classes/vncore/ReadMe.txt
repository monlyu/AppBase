外部包引用
-->ASIHttpRequset
1.Add SystemConfiguration.framework
2.Add libxml2.dylib
    add HeadSearchPath ${SDK_DIR}/usr/include/libxml2
    add OtherLinkFlag -lxml2
3.Add CFNetwork.framework
4.Add MobileCoreServices.framework
5.Add libz.1.2.5.dylib

-->ODRefreshControl
6.Add QuartzCore.framework

-->FMDB
7.Add libsqlite3.dylib