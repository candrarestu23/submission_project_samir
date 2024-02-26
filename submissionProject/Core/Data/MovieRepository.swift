//
//  LoansRepository.swift
//  submissionProject
//
//  Created by candra restu
//

import Foundation
import RxSwift

protocol LoansRepositoryDelegate: AnyObject {
    
    func getLoans() -> Observable<LoansModel>
}

final class LoansRepository: NSObject {
    
    typealias LoansInstance = (RemoteDataSource) -> LoansRepository
    
    fileprivate let remote: RemoteDataSource
    
    private init(remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: LoansInstance = { remoteRepo in
        return LoansRepository(remote: remoteRepo)
    }
    
}

extension LoansRepository: LoansRepositoryDelegate {

    func getLoans() -> Observable<LoansModel> {
        
        return self.remote.getLoans(from: .getLoans).map {
            return LoansMapper.mapLoanToDomain(input: $0)
        }
    }
}
