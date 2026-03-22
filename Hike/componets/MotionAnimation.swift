import SwiftUI

struct MotionAnimation: View {
    @State private var randomCircle: Int = Int.random(in: 0...15)
    @State private var isAnimation: Bool = false
    
    //MARK: - Functions
    func randomCoordinates() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    func randomSize()-> CGFloat{
        return CGFloat(Int.random(in: 0...80))
    }
    
    
    func randomScale()-> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundStyle(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinates(),
                        y: randomCoordinates()
                    )
                    .scaleEffect(isAnimation ?   randomScale() : 1)
                    .onAppear(perform:{
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ){
                           isAnimation = true
                        }
                    }
                    
                    )
            }
        }
        .frame(width: 256,height: 256)
    }
}

#Preview {
    ZStack {
        Color.teal.ignoresSafeArea()
        MotionAnimation()
    }
}
