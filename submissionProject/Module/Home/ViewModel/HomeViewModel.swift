//
//  HomeViewModel.swift
//  submissionProject
//
//  Created by candra restu on 19/05/22.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel: ObservableObject {
    
    private let disposeBag = DisposeBag()
    private var homeUseCase: HomeUseCase?
    let data = BehaviorRelay<[LoanModel]>(value: [])
    let isLoading = ObservableData<Bool>()
    let isEmpty = ObservableData<Bool>()
    let errorMessage = ObservableData<String>()
    let type = ObservableData<String>()
    var dataList: [LoanModel] = []
    var router: HomeRouter?

    init(homeUseCase: HomeUseCase?, router: HomeRouter?) {
        self.homeUseCase = homeUseCase
        self.router = router
        self.type.value = "Name"
    }
    
    func getLoans() {
        isLoading.value = true
        homeUseCase?.getLoans()
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] result in
                guard let listLoans = result.loans else { return }
                self?.dataList = listLoans
                self?.data.accept(listLoans)
            } onError: { [weak self] error in
                self?.errorMessage.value = error.localizedDescription
            } onCompleted: {
                
            }.disposed(by: disposeBag)
    }
    
    func sortLoans(sortBy: String) {
        var tempData = dataList
        if sortBy == "Name" {
            tempData = tempData.sorted(by: { $0.borrower.name < $1.borrower.name })
        } else if sortBy == "Term" {
            tempData = tempData.sorted(by: { $0.term < $1.term })
        } else {
            tempData = tempData.sorted(by: { $0.riskRating < $1.riskRating })
        }
        
        self.data.accept(tempData)
    }
    
    func onItemListSelected(index: Int) {
        guard let data = self.data.value.at(index: index) else { return }
        self.router?.routeToDetailPage(data)
    }
    
    func onCategorySelecter(delegate: BottomSheetDelegate) {
        self.router?.routeToBottomSheet(delegate: delegate)
    }
}
