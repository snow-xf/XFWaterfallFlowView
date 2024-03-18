//
//  XFWaterfallFlow.swift
//
//
//  Created by 雪飞 on 2024/3/15.
//

import Foundation
import SwiftUI
import UIKit

class XFWaterfallFlow: UICollectionView{
    private let fallFllowLayout:XFWaterfallFlowLayout  = XFWaterfallFlowLayout()
    private var identifier = ""
    init(_ cellClass:AnyClass,identifier:String = "XFWaterfallFlowCell") {
        super.init(frame: .zero, collectionViewLayout: fallFllowLayout)
        self.delegate = self;
        self.dataSource = self;
        self.identifier = identifier
        self.register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    
    func setLayoutValue(model:XFComputeLayoutModel) {
        fallFllowLayout.computeLayoutModel = model
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


/// 实现代理方法和数据源方法
extension XFWaterfallFlow:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath)
        return cell
    }
}
