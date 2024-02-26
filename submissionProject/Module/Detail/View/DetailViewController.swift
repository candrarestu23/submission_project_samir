//
//  DetailViewController.swift
//  submissionProject
//
//  Created by Candra on 2/26/24.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var creditScoreLabel: UILabel!
    @IBOutlet weak var collateralTypeLabel: UILabel!
    @IBOutlet weak var collateralValueLabel: UILabel!
    @IBOutlet weak var repaymentSchedule: UILabel!
    @IBOutlet weak var fileImage: UIImageView!
    
    var data: LoanModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        guard let data else { return }
        nameLabel.text = data.borrower.name
        emailLabel.text = data.borrower.email
        creditScoreLabel.text = "\(data.borrower.creditScore)"
        collateralTypeLabel.text = data.collateral.type
        collateralValueLabel.text = String(data.collateral.value).toCurrency()
        
        var tempSchedule = ""
        for item in data.repaymentSchedule.installments {
            tempSchedule += "Amount :\(String(data.amount).toCurrency()) \nDue Date : \(item.dueDate)\n\n"
        }
        repaymentSchedule.text = tempSchedule
        let imageUrl = URL(string: "\(Constant.BaseImage)\(data.documents[0].url)")
        fileImage.sd_setImage(with: imageUrl)
    }

    @IBAction func onTapImage(_ sender: Any) {
        guard let data else { return }
        let view = ImageViewerViewController()
        view.imageURL = URL(string: "\(Constant.BaseImage)\(data.documents[0].url)")
        self.present(view, animated: true)
    }
    
}
