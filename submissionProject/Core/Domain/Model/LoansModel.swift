//
//  LoansModel.swift
//  submissionProject
//
//  Created by Candra on 2/25/24.
//

import Foundation

struct LoansModel {
    var loans: [LoanModel]?

    init(loans: [LoanModel]) {
        self.loans = loans
    }
}

struct LoanModel {
    var id: String
    var amount: Int
    var interestRate: Double
    var term: Int
    var purpose: String
    var riskRating: String
    var borrower: BorrowerModel
    var collateral: CollateralModel
    var documents: [DocumentModel]
    var repaymentSchedule: RepaymentScheduleModel

    init(id: String,
         amount: Int,
         interestRate: Double,
         term: Int,
         purpose: String,
         riskRating: String,
         borrower: BorrowerModel,
         collateral: CollateralModel,
         documents: [DocumentModel],
         repaymentSchedule: RepaymentScheduleModel) {
        self.id = id
        self.amount = amount
        self.interestRate = interestRate
        self.term = term
        self.purpose = purpose
        self.riskRating = riskRating
        self.borrower = borrower
        self.collateral = collateral
        self.documents = documents
        self.repaymentSchedule = repaymentSchedule
    }
}

struct BorrowerModel {
    var id: String
    var name: String
    var email: String
    var creditScore: Int
}

struct CollateralModel {
    var type: String
    var value: Int
}

struct DocumentModel {
    var type: String
    var url: String
}

struct RepaymentScheduleModel {
    var installments: [InstallmentModel]
}

struct InstallmentModel {
    var dueDate: String
    var amountDue: Int
}
