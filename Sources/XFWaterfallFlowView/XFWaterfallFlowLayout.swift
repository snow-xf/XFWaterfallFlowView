//
//  XFWaterfallFlowLayout.swift
//
//
//  Created by 雪飞 on 2024/3/15.
//

import UIKit

class XFWaterfallFlowLayout: UICollectionViewLayout {
    /// 所有cell的布局属性
    var computeLayoutModel:XFComputeLayoutModel = XFComputeLayoutModel()
    
    
    var collectionViewContentWidth: CGFloat{
        guard let collectionView = collectionView else { return 0.1 }
        return collectionView.bounds.width - collectionView.contentInset.left - collectionView.contentInset.right
    }
    
    //配置collectionView内容size(非可见部分的size)
    override var collectionViewContentSize: CGSize{
        CGSize(width: collectionViewContentWidth, height: computeLayoutModel.contentHeight)
    }
    
    override func prepare() {
        super.prepare()
    }
        
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributesArr: [UICollectionViewLayoutAttributes] = []
        
        for layoutAttributes in computeLayoutModel.layoutAttributes{
            if layoutAttributes.frame.intersects(rect){
                visibleLayoutAttributesArr.append(layoutAttributes)
            }
        }
        
        return visibleLayoutAttributesArr
    }

    //给各个cell设定布局属性
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return computeLayoutModel.layoutAttributes[indexPath.item]
    }
    
}
