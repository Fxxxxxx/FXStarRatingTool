# FXStarRatingTool - iOS超方便的评星工具
- ### 前言
评星，在移动开发中经常会用到，例如淘宝的评价，外卖的订单评价等等，用最多5颗星星给出相应的评价。在安卓中，有相应的RatingBar控件，而iOS就没有这么方便来，需要我们自定义，所以我写了这个名为FXStarRatingTool的框架，方便大家用及其简单的代码完成集成开发。
> GitHub地址： https://github.com/Fxxxxxx/FXStarRatingTool		
使用swift4.0 		
iOS8.0及以上		
点击、拖动都有效

- ### 效果展示：
![效果图.gif](http://upload-images.jianshu.io/upload_images/3569202-09c7ee8583213e1a.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- ### 集成方法：

 1.  **Cocoapods集成**
```
 pod  'FXStarRatingTool'
```
2. **下载工程，把根目录的FXStarRatingTool文件夹整个拉入工程**

![image.png](http://upload-images.jianshu.io/upload_images/3569202-2ef4b4e4537c9e99.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- ### 使用
```
let ratingView = FXStarRatingTool()
ratingView.isAllowHalf = true
ratingView.themeColor = UIColor.red
ratingView.callBack = { (count) -> () in
    //do something u want
}
ratingView.show()
```
- **isAllowHalf  是否允许半星**
- **themeColor  App主体的颜色，这里就是评价按钮的字体颜色**
- **callBack  返回星数的闭包**
这几个属性都是选填的，不设置也会有默认值，创建好直接`show()`就可以显示了，是不是超级方便😛

**欢迎使用和交流,  e2shao1993@163.com**
