//
//  UITableView+Extension.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 20/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
