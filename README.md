# XFWaterfallFlowView
 
## SwiftUI 瀑布流
 
* 封装自 UICollectionView
* 当前版本未添加 footerView、headerview。
* 目前只做了一个section的情况，不支持多section
* 功能较单一，仅能实现基础的展示、点击等操作。复杂的功能后续再行封装。或者干脆不用该库。直接UICollectionView，最后包装一下
* demo之后再发布,以下是用法
```
struct WaterfallFlowView: View {
    /// 瀑布流布局需要用到的
    @State var layoutModel:XFComputeLayoutModel?
    
    /// 多少个Item
    @State var numberOfItems = 21
    
    /// 每行多少个Item
    @State var columnCount = 2
    
    private var identifier = "waterfallFlowViewIdentifier"
    

    var body: some View {        
        XFWaterfallFlowView(cellClass: myCollectionViewCell.classForCoder(),
                            waterfallFlowViewIdentifier: identifier,
                            delegateClass: waterfallFlowViewDelegate(),
                            dataSourceClass: dataSource(waterfallFlowViewIdentifier: identifier,numberOfItemsInSection: numberOfItems),
                            layoutModel: $layoutModel)
        .onAppear(){
            /// 调用 XFComputeLayout 方法计算出每个cell的布局属性
            let itemWidth = (SCREEN_WIDTH - CGFloat(4))/CGFloat(columnCount)
            layoutModel = XFComputeLayout(numberOfItems:numberOfItems,itemHeight: { index in
                /// 根据index计算出当前cell占用的高度
                if let image = UIImage(named: "\(index)"){
                    let imgSize:CGSize = image.size
                    return itemWidth * (imgSize.height/imgSize.width)
                }else{ return 0}
            })
        }
    }
    
    
    /// 实现dataSource方法
    class dataSource: waterfallFlowViewDataSource {
        override func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.numberOfItemsInSection
        }
        
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.waterfallFlowViewIdentifier, for: indexPath) as! myCollectionViewCell
            cell.name = "\(indexPath.row)"
            return cell
        }
    }
}
```


#### 效果
![gif](https://github.com/snow-xf/XFWaterfallFlowView/blob/main/%25E5%25BD%2595%25E5%25B1%258F2024-03-18%252020.47.37.gif)

![图片](https://github.com/snow-xf/XFWaterfallFlowView/blob/main/WX20240318-204724%402x.png)
