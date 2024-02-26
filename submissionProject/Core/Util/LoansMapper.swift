//
//  LoansMapper.swift
//  submissionProject
//
//  Created by Candra on 2/25/24.
//

import Foundation

final class LoansMapper {
    static func mapLoanToDomain(input loansResponse: LoansResponse) -> LoansModel {
        var loans: [LoanModel] = []

        for loanResponse in loansResponse {
            let borrower = BorrowerModel(
                id: loanResponse.borrower.id,
                name: loanResponse.borrower.name,
                email: loanResponse.borrower.email,
                creditScore: loanResponse.borrower.creditScore
            )

            let collateral = CollateralModel(
                type: loanResponse.collateral.type,
                value: loanResponse.collateral.value
            )

            var documents: [DocumentModel] = []
            for document in loanResponse.documents {
                let documentModel = DocumentModel(
                    type: document.type,
                    url: document.url
                )
                documents.append(documentModel)
            }

            var installments: [InstallmentModel] = []
            for installment in loanResponse.repaymentSchedule.installments {
                let installmentModel = InstallmentModel(
                    dueDate: installment.dueDate,
                    amountDue: installment.amountDue
                )
                installments.append(installmentModel)
            }

            let repaymentSchedule = RepaymentScheduleModel(installments: installments)

            let loanModel = LoanModel(
                id: loanResponse.id,
                amount: loanResponse.amount,
                interestRate: loanResponse.interestRate,
                term: loanResponse.term,
                purpose: loanResponse.purpose,
                riskRating: loanResponse.riskRating,
                borrower: borrower,
                collateral: collateral,
                documents: documents,
                repaymentSchedule: repaymentSchedule
            )

            loans.append(loanModel)
        }

        return LoansModel(loans: loans)
    }
}
