//
//  HomeRouter.swift
//  submissionProject
//
//  Created by candra restu on 19/05/22.
//

import Foundation
import UIKit

protocol HomeRoutingDelegate : AnyObject {
    func routeToDetailPage(_ loan: LoanModel)
}

class HomeRouter {

    var view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension HomeRouter: HomeRoutingDelegate {
    func routeToDetailPage(_ loan: LoanModel) {
        let detailView = DetailViewController()
        detailView.data = loan
        self.view.navigationController?.pushViewController(detailView, animated: true)
    }

    func routeToBottomSheet(delegate: BottomSheetDelegate) {
        let bottomSheet = HomeBuilder.build(
            container: SceneDelegate.container,
            delegate: delegate
        )
        self.view.present(bottomSheet, animated: true, completion: nil)
    }
}
