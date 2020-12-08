//
//  DateFormatter+Extension.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 24/11/2020.
//

import Foundation

extension DateFormatter {
    static var monthYearDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter
    }
}
