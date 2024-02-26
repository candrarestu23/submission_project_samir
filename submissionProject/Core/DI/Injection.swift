//
//  Injection.swift
//  submissionProject
//
//  Created by candra restu on 19/05/22.
//

import Foundation
import Swinject
import SwinjectStoryboard

final class Injection: NSObject {
    
    private func provideRepository() -> LoansRepositoryDelegate {
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        
        return LoansRepository.sharedInstance(remote)
    }
    
    func provideHome() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
    
    func provideHomeViewModel(container: Container) {
        let homeViewController = HomeViewController(
            nibName: "HomeViewController",
            bundle: nil)
        container.register(HomeRouter.self) { _ -> HomeRouter in
            return HomeRouter(view: homeViewController)
        }
        
        container.register(HomeViewModel.self) { resolver -> HomeViewModel in
            return HomeViewModel(homeUseCase: self.provideHome(),
                                 router: resolver.resolve(HomeRouter.self)!)
        }
        
        container.register(HomeViewController.self) { resolver -> HomeViewController in
            homeViewController.viewModel = resolver.resolve(HomeViewModel.self)
            return homeViewController
        }
    }
    
    func provideBottomSheetViewModel(container: Container, delegate: BottomSheetDelegate) {
        let viewController = BottomSheetViewController(
            nibName: "BottomSheetViewController",
            bundle: nil)
        
        container.register(BottomSheetViewModel.self) { _ -> BottomSheetViewModel in
            return BottomSheetViewModel()
        }
        
        container.register(BottomSheetViewController.self) { resolver -> BottomSheetViewController in
            viewController.viewModel = resolver.resolve(BottomSheetViewModel.self)
            viewController.delegate = delegate
            return viewController
        }
    }
}
