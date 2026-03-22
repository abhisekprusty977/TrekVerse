import SwiftUI

struct CustomCircleView: View {
    @State var gradientAnimation: Bool = false
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [
                        .gray,
                        .customIndigoMedium,.customGreenLight
                        
                    ],
                                   
                                   startPoint: gradientAnimation ?.topLeading : .bottomLeading, endPoint: gradientAnimation ? .bottomTrailing : .bottomTrailing)
                    
                )
                .onAppear {
                    withAnimation(.linear(duration: 3) .repeatForever(autoreverses: true)){
                        gradientAnimation.toggle()
                    }
                    
                   
                }
                .frame(width: 256, height: 256)
            MotionAnimation()
        }
        
        
    }
}

#Preview {
    CustomCircleView()
}
