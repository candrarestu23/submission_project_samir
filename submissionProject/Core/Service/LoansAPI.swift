//
//  LoansAPI.swift
//  submissionProject
//
//  Created by candra restu
//

import Foundation

enum LoansAPI {
    case getLoans
}

extension LoansAPI: EndPointType {
    
    var urlRequest: URLRequest {
        switch self {
        case .getLoans:
            let fullURL = self.baseUrl.appendingPathComponent(self.path)
            var components = URLComponents(string: fullURL.absoluteString)
            return URLRequest(url: (components?.url!)!)
        }
    }

    var baseUrl: URL {
        return URL(string: "https://raw.githubusercontent.com")!
    }

    var path: String {
        switch self {
        case .getLoans:
            return "/andreascandle/p2p_json_test/main/api/json/loans.json"
        }
    }

}
