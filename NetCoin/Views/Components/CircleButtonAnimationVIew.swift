/*


  Created by Kwabena Ankamah on 08/12/2022.
  
*/
import SwiftUI
struct CircleButtonAnimationVIew: View {
    @Binding var animate: Bool
    var body: some View {
       Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
    }
}
struct CircleButtonAnimationVIew_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationVIew(animate: .constant(false))
            .foregroundColor(.red)
            .frame(width: 100, height: 100)
    }
}
