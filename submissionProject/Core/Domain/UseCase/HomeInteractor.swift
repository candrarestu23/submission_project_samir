//
//  HomeInteractor.swift
//  submissionProject
//
//  Created by candra restu on 19/05/22.
//

import Foundation
import RxSwift

protocol HomeUseCase {
    func getLoans() -> Observable<LoansModel>
}

class HomeInteractor: HomeUseCase {
    private let repository: LoansRepositoryDelegate
    
    required init(repository: LoansRepositoryDelegate) {
        self.repository = repository
    }
    
    func getLoans() -> RxSwift.Observable<LoansModel> {
        return repository.getLoans()
    }
}
