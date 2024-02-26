//
//  LoansResponse.swift
//  submissionProject
//
//  Created by Candra on 2/25/24.
//

import Foundation

// MARK: - LoansResponseElement
struct LoansResponseElement: Codable {
    let id: String
    let amount: Int
    let interestRate: Double
    let term: Int
    let purpose: String
    let riskRating: String
    let borrower: Borrower
    let collateral: Collateral
    let documents: [Document]
    let repaymentSchedule: RepaymentSchedule
}

// MARK: - Borrower
struct Borrower: Codable {
    let id, name, email: String
    let creditScore: Int
}

// MARK: - Collateral
struct Collateral: Codable {
    let type: String
    let value: Int
}

// MARK: - Document
struct Document: Codable {
    let type: String
    let url: String
}

// MARK: - RepaymentSchedule
struct RepaymentSchedule: Codable {
    let installments: [Installment]
}

// MARK: - Installment
struct Installment: Codable {
    let dueDate: String
    let amountDue: Int
}

typealias LoansResponse = [LoansResponseElement]
