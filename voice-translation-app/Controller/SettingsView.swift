import SwiftUI

struct SettingsView: View {
    @State var showNavigation: String = "Clicker"
    @Binding var selectedTab: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                GradientView()
            }
            
            VStack {
                TitleView(title: "Settings")
            }
            .frame(maxWidth: 100, maxHeight: 100)
            .position(x: 1 + 200, y: 1 + 300)
            HStack(spacing: 30){
                BottomTabItemView(title: "Translator", image: "bubble.left.and.bubble.right", selectedTab: $showNavigation)
                BottomTabItemView(title: "Clicker", image: "gearshape", selectedTab: $showNavigation)
                }
            .frame(width: 216, height: 82)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 4)
            .position(x: 1 + 200, y: 1 + 716)
            if showNavigation == "Translator" {
                StartView()
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

#Preview {
    SettingsView(selectedTab: .constant("Clicker"))
}
