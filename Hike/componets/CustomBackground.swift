import SwiftUI

struct CustomBackground: View {
    var body: some View {
       
        LinearGradient(colors: [Color.colorGreenLight,Color.customGreenMedium], startPoint: .top, endPoint: .bottom)
            .cornerRadius(40)
    }
}

#Preview {
    CustomBackground()
        .padding(30)
        .frame(width: 380, height: 500)
}
