# XFWaterfallFlowView
 
## SwiftUI 瀑布流
 
* 封装自 UICollectionView
* 当前版本未添加 footerView、headerview。
* 目前只做了一个section的情况，不支持多section
* 功能较单一，仅能实现基础的展示、点击等操作。复杂的功能后续再行封装。或者干脆不用该库。直接UICollectionView，最后包装一下

### demo之后再发布,以下是用法
* **在SwiftUI文件中直接使用**
```
XFWaterfallFlowView(cellClass: myCollectionViewCell.classForCoder(),
                            waterfallFlowViewIdentifier: identifier,
                            delegateClass: waterfallFlowViewDelegate(),
                            dataSourceClass: dataSource(waterfallFlowViewIdentifier: identifier,numberOfItemsInSection: numberOfItems),
                            layoutModel: $layoutModel)
                            
```
* **需要传入的几个参数说明**

| cellClass                   | 自定义cell的class类型                                       |
|-----------------------------|:------------------------------------------------------------|
| waterfallFlowViewIdentifier | identifier                                                  |
| delegateClass               | 实现代理方法的class，需要继承自XFWaterfallFlowViewDelegate   |
| dataSourceClass             | 实现数据源方法的class，需要继承自XFWaterfallFlowViewDataSource |
| layoutModel                 | 瀑布流布局属性                                              |

* **layoutModel的说明**

    1. 包含所有cell的布局属性<u>layoutAttributes</u>与collectionView的ContentSize高度<u>contentHeight</u>
    2. 调用 <u>XFComputeLayout</u> 方法计算,并根据index计算返回当前cell的高度
        ```
        let itemWidth = (SCREEN_WIDTH - CGFloat(4))/CGFloat(columnCount)
        layoutModel = XFComputeLayout(numberOfItems:numberOfItems,itemHeight: { index in
            /// 根据index计算出当前cell占用的高度
            if let image = UIImage(named: "\(index)"){
                let imgSize:CGSize = image.size
                return itemWidth * (imgSize.height/imgSize.width)
            }else{ return 0}
        })
        ``` 

#### 效果


![gif](https://github.com/snow-xf/XFWaterfallFlowView/blob/main/%25E5%25BD%2595%25E5%25B1%258F2024-03-18%252020.47.37.gif)

![图片](https://github.com/snow-xf/XFWaterfallFlowView/blob/main/WX20240318-204724%402x.png)
