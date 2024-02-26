//
//  RemoteDataSource.swift
//  submissionProject
//
//  Created by candra restu on 19/05/22.
//

import Foundation
import Alamofire
import RxSwift

protocol RemoteDataSourceProtocol: AnyObject {
    
    func getLoans(from endpoint: LoansAPI) -> Observable<LoansResponse>

}

final class RemoteDataSource: NSObject {
    
    private override init() { }
    
    static let sharedInstance: RemoteDataSource =  RemoteDataSource()
    
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    func getLoans(from endpoint: LoansAPI) -> RxSwift.Observable<LoansResponse> {
        return Observable<LoansResponse>.create { observer in
            AF.request(endpoint.urlRequest)
                .validate()
                .responseDecodable(of: LoansResponse.self) { response in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            return Disposables.create()
        }
    }
}
