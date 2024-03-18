import UIKit
import SwiftUI

struct XFWaterfallFlowView:UIViewRepresentable {
    
    typealias UIViewType = XFWaterfallFlow
    
    private var cellClass:AnyClass
    
    private var waterfallFlowViewIdentifier = "waterfallFlowViewCell"
    
    private let delegateClass:XFWaterfallFlowViewDelegate?

    private let dataSourceClass:XFWaterfallFlowViewDataSource?
    
    @Binding var layoutModel:XFComputeLayoutModel?

    init(cellClass: AnyClass, waterfallFlowViewIdentifier: String = "waterfallFlowViewCell", delegateClass: XFWaterfallFlowViewDelegate?, dataSourceClass: XFWaterfallFlowViewDataSource?, layoutModel: Binding<XFComputeLayoutModel?>) {
        self.cellClass = cellClass
        self.waterfallFlowViewIdentifier = waterfallFlowViewIdentifier
        self.delegateClass = delegateClass
        self.dataSourceClass = dataSourceClass
        self._layoutModel = layoutModel
    }
    
    
    

    func makeUIView(context: Context) -> XFWaterfallFlow {
        let waterfallFlow = XFWaterfallFlow(cellClass,identifier: waterfallFlowViewIdentifier)
        waterfallFlow.delegate = context.coordinator.0
        waterfallFlow.dataSource = context.coordinator.1
        return waterfallFlow
    }
   
        
    func makeCoordinator() -> (XFWaterfallFlowViewDelegate,XFWaterfallFlowViewDataSource) {
        return (delegateClass ?? XFWaterfallFlowViewDelegate(),
                dataSourceClass ?? XFWaterfallFlowViewDataSource(waterfallFlowViewIdentifier: waterfallFlowViewIdentifier))
    }
    
    
    
    func updateUIView(_ uiViewController: XFWaterfallFlow, context: Context) {
        if let layoutModel {
            uiViewController.setLayoutValue(model: layoutModel)
        }
    }
    
}

class XFWaterfallFlowViewDelegate:NSObject, UICollectionViewDelegate {
    
}

class XFWaterfallFlowViewDataSource:NSObject, UICollectionViewDataSource {
    var waterfallFlowViewIdentifier = ""
    var numberOfSections = 1
    var numberOfItemsInSection = 0
    init(waterfallFlowViewIdentifier: String = "", numberOfSections: Int = 1, numberOfItemsInSection: Int = 0) {
        self.waterfallFlowViewIdentifier = waterfallFlowViewIdentifier
        self.numberOfSections = numberOfSections
        self.numberOfItemsInSection = numberOfItemsInSection
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: waterfallFlowViewIdentifier, for: indexPath)
        return cell
    }
}

