//
//  HomeViewController.swift
//  submissionProject
//
//  Created by candra restu on 19/05/22.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModel?
    var disposeBag = DisposeBag()
    
    lazy var spinner = UIActivityIndicatorView(
        frame:CGRect(x: 0,
                     y: 0,
                     width: self.tableView.frame.width,
                     height: 60)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavBar()
        bindData()
        viewModel?.getLoans()
    }
    
    private func setupTableView() {
        let nibName = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "HomeCell")
    }
    
    private func setupNavBar() {
        self.title = "Home"
    }
    
    private func bindData() {
        viewModel?.data
            .bind(to:tableView.rx.items(
                cellIdentifier: "HomeCell",
                cellType: HomeTableViewCell.self)) { [weak self] index, item, cell in
                    cell.setupCell(item)
                }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.viewModel?.onItemListSelected(index: indexPath.row)
            }).disposed(by: disposeBag)
        
        viewModel?.isLoading.observe(disposeBag) { [weak self] (isLoading) in
            guard let isLoading = isLoading else {
                return
            }

            if isLoading {
                self?.spinner.startAnimating()
            } else {
                self?.spinner.stopAnimating()
            }
        }
        
        viewModel?.isEmpty.observe(disposeBag) { (isEmpty) in
            guard let isEmpty = isEmpty else {
                return
            }
//            self.emptyListLabel.isHidden = !isEmpty
        }
    }
    
    @IBAction func onCategoryClick(_ sender: Any) {
        viewModel?.onCategorySelecter(delegate: self)
    }

    func showErrorAlert(errorMessage: String) -> UIAlertController {
        let refreshAlert = UIAlertController(
            title: "Network Error",
            message: "Something work with the netwok, try again later!",
            preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(
            UIAlertAction(title: "Ok",
                          style: .default,
                          handler: { ( _ : UIAlertAction!) in

        }))

        return refreshAlert
    }
}

extension HomeViewController: BottomSheetDelegate {
    func onItemSelected(type: String) {
        viewModel?.type.value = type
        viewModel?.data.accept([])
        viewModel?.sortLoans(sortBy: type)
    }
}
