import SwiftUI

struct HikeButton: View {
    var body: some View {
        
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.white,.customGreenLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
                )
            Circle()
                .stroke(LinearGradient(colors: [.customGreenLight,.customGrayMedium], startPoint: .top, endPoint: .bottom))
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 32))
                .foregroundStyle( LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom))
           
               
           
                
        }.frame(width: 59, height: 59)
        
    }
}

#Preview {
    HikeButton()
        
}
