import SwiftUI

struct SplashView: View {
    @Binding var isActive: Bool
    @State private var animate = false

    var body: some View {
        ZStack {
            CustomBackground()

            // If CustomBackground is not available in your project, replace the above line with a gradient background like below:
            // LinearGradient(colors: [.green.opacity(0.6), .green], startPoint: .top, endPoint: .bottom)
            //     .ignoresSafeArea()

            VStack(spacing: 24) {
                ZStack {
                    // Decorative circle background similar to card
                    Circle()
                        .fill(LinearGradient(colors: [.gray.opacity(0.3), .gray.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: animate ? 220 : 180, height: animate ? 220 : 180)
                        .scaleEffect(animate ? 1.05 : 0.95)
                        .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: animate)

                    Image(systemName: "figure.hiking")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.white, .green)
                        .font(.system(size: 80, weight: .black, design: .rounded))
                        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 6)
                }

                VStack(spacing: 8) {
                    Text("HIKING")
                        .font(.system(size: 42, weight: .black, design: .rounded))
                        .foregroundStyle(LinearGradient(colors: [.gray, .gray], startPoint: .top, endPoint: .bottom))
                    Text("Fun and Adventure")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
        }
        .onAppear {
            animate = true
            // Simulate loading then transition to the app
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                withAnimation(.easeInOut) {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    StatefulPreviewWrapper(false) { isActive in
        SplashView(isActive: isActive)
    }
}

// Helper for binding previews
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    let content: (Binding<Value>) -> Content
    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: value)
        self.content = content
    }
    var body: some View { content($value) }
}
