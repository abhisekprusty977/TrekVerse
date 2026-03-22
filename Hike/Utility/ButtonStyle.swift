import Foundation
import SwiftUI

struct GradientButtonStyle : ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.horizontal,30)
            .padding(.vertical)
            .background(
                configuration.isPressed ?
                LinearGradient(colors: [.customGreenDark,.customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                    
                LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
           )
            .cornerRadius(20)
            
              
       
    }
    
}
