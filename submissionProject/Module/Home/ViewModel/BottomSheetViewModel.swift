//
//  BottomSheetViewModel.swift
//  submissionProject
//
//  Created by candra restu on 21/05/22.
//

import Foundation
import RxSwift
import RxCocoa

class BottomSheetViewModel: ObservableObject {
    private let disposeBag = DisposeBag()
    let data = BehaviorRelay<[String]>(value: [])
    let categoryName = ["Name", "Term", "Risk Ratting"]

    func setupData() {
        data.accept(categoryName)
    }
    
    func onItemListSelected() {
        
    }
}
