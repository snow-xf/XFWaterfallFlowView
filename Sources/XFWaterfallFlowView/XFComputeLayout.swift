//
//  XFWaterFallFlowLayoutModels.swift
//  testxf
//
//  Created by 雪飞 on 2024/3/17.
//

import Foundation
import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height


struct XFComputeLayoutModel{
    var layoutAttributes:[UICollectionViewLayoutAttributes] = []
    var contentHeight:CGFloat = 0.0
}
/// 计算 UICollectionViewLayout 数据
/// - Parameters:
///   - collectionViewContentWidth: 默认屏幕宽度
///   - numberOfItems: 总共多少个item
///   - columnCount: 每一行多少个
///   - columnSpacing: 横向间距，默认4
///   - lineSpacing: 纵向间距，默认4
///   - itemHeight: 当前 tem的高度
/// - Returns:ComputeLayoutModel
func XFComputeLayout(_ collectionViewContentWidth:CGFloat? = SCREEN_WIDTH ,columnCount:Int? = 2,numberOfItems:Int? = 2,columnSpacing:CGFloat? = 4,lineSpacing:CGFloat? = 4,itemHeight: @escaping (_: Int) -> CGFloat) -> XFComputeLayoutModel{
    var layoutAttributesArr: [UICollectionViewLayoutAttributes] = []
    var collectionViewContentHeight = 0.0
    let itemWidth = (SCREEN_WIDTH - columnSpacing!) / CGFloat(columnCount!) //cell的宽
    var x: [CGFloat] = []   // 计算出所有X
    for column in 0..<columnCount!{
        x.append((itemWidth + columnSpacing!) * CGFloat(column))
    }
    
    var y: [CGFloat] = Array(repeating: 0, count: columnCount!)//[0, 0]
    
    var column = 0

    //依次算出每个cell的布局属性
    for item in 0..<numberOfItems!{
        
        let itemHeight:CGFloat  = itemHeight(item)
        
        //得出每个cell的frame
        let itemFrame = CGRect(x: x[column], y: y[column], width: itemWidth, height: itemHeight)
        
        //处理每个cell的布局属性
        let layoutAttributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: item, section: 0))
        layoutAttributes.frame = itemFrame
        layoutAttributesArr.append(layoutAttributes)
        
        //得出collectionView的内容高度
        collectionViewContentHeight = max(collectionViewContentHeight, itemFrame.maxY)
                
        //更新y数组
        y[column] = y[column] + itemHeight + lineSpacing!
        
        //更新column（下一个cell应当排列在高度更小的cell之下,计算出应当放置在第几列）
        column = y.firstIndex(of: y.min()!)!
    }
    return XFComputeLayoutModel(layoutAttributes: layoutAttributesArr,contentHeight: collectionViewContentHeight)
}



