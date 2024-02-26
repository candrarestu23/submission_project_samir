//
//  HomeTableViewCell.swift
//  submissionProject
//
//  Created by candra restu on 19/05/22.
//

import UIKit

class HomeTableViewCell: BaseTableCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loanAmountLabel: UILabel!
    @IBOutlet weak var interestRateLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var purposeLabel: UILabel!
    @IBOutlet weak var ristRatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cardView.dropShadow()
        self.cardView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(_ data: LoanModel) {
        nameLabel.text = data.borrower.name
        loanAmountLabel.text = String(data.amount).toCurrency()
        interestRateLabel.text = "\(data.interestRate) %"
        termLabel.text = "\(data.term) Months"
        purposeLabel.text = data.purpose
        ristRatingLabel.text = data.riskRating
    }
}
