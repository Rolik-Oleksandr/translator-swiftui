import SwiftUI
import Foundation

struct GradientView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.theme.lightGreen, Color.theme.white]),
                startPoint: .bottom,
                endPoint: .top
            )
            .ignoresSafeArea()
        }
    }
}

#Preview {
    GradientView()
}
