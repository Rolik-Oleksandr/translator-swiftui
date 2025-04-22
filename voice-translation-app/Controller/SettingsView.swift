import SwiftUI

struct SettingsView: View {
    @State var showNavigation: String = "Clicker"
    @Binding var selectedTab: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                GradientView()
            }
            TitleView(title: "Settings")
                .padding(.horizontal, 10)
            
        
            VStack(spacing: 15) {
                SettingsCell(title: "Rate us")
                SettingsCell(title: "Share App")
                SettingsCell(title: "Contact Us")
                SettingsCell(title: "Restore Purchases")
                SettingsCell(title: "Privacy Policy")
                SettingsCell(title: "Terms of Use")
            }
            .padding(.vertical, 100)
            
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

struct SettingsCell : View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.black.opacity(0.6))
        }
        .padding()
        .background(Color.theme.settingCellViewLightBlue)
        .cornerRadius(20)
        .padding(.horizontal)
    }
    
}

#Preview {
    SettingsView(selectedTab: .constant("Clicker"))
}
