//
//  UIApplication.swift
//  NetCoin
//
//  Created by Kwabena Ankamah on 05/12/2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    func closeEdit() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
