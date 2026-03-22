import SwiftUI

struct RootView: View {
    @State private var showMain = false

    var body: some View {
        Group {
            if showMain {
                CardView()
                    .transition(.opacity.combined(with: .scale))
            } else {
                SplashView(isActive: $showMain)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: showMain)
    }
}

#Preview {
    RootView()
}
