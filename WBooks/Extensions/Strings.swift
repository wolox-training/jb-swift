//
//  Strings.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

import UIKit

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func localized(withArguments arguments: CVarArg...) -> String {
        return String(format: self.localized(), arguments: arguments)
    }
}
