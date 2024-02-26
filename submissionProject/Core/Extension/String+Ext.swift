//
//  String+Ext.swift
//  submissionProject
//
//  Created by candra restu on 18/05/22.
//

import Foundation

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options:
                                            [.documentType:
                                                NSAttributedString.DocumentType.html,
                                             .characterEncoding:String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    func toCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.numberStyle = NumberFormatter.Style.decimal
        return "Rp\(formatter.string(for: Int(self) ?? 0)!)"
    }
}
