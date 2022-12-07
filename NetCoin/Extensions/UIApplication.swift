
import Foundation
import SwiftUI

extension UIApplication {
    func closeEdit() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
