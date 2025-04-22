import SwiftUI

struct StartView: View {
    @State private var selectedTab = "Translator"
    @State private var selectedAnimal = "dog"
    @State private var showSettings = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                GradientView()
            }
            TitleView()
            
            VStack {
                Image(selectedAnimal)
                    .resizable()
                    .frame(width: 184, height: 184)
                    .position(x: 203, y: 550)
            }
            
            MicroRectView()
                .frame(width: 170, height: 170)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 2)
                .position(x: 35 + 100, y: 230 + 88)
            
            VStack {
                SelectAnimalView(
                    animal: "cat",
                    image: "cat",
                    color: Color.blue.opacity(0.5),
                    selectedAnimal: $selectedAnimal)
                
                SelectAnimalView(
                    animal: "dog",
                    image: "dog",
                    color: Color.theme.animalBackGroundGreen,
                    selectedAnimal: $selectedAnimal)
            }
            .frame(width: 100, height: 170)
            .padding(3)
            .background(.white)
            .opacity(0.8)
            .cornerRadius(20)
            .position(x: 35 + 265, y: 230 + 88)
            
            HStack(spacing: 30) {
                BottomTabItemView(title: "Translator", image: "bubble.left.and.bubble.right", selectedTab: $selectedTab)
                BottomTabItemView(title: "Clicker", image: "gearshape", selectedTab: $selectedTab)
            }
            .frame(width: 216, height: 82)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 4)
            .position(x: 1 + 200, y: 1 + 716)
            if selectedTab == "Clicker" {
                SettingsView(selectedTab: .constant("Clicker"))
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

struct TitleView: View {
    var body: some View {
        HStack {
            Text("Translator")
                .frame(width: 350, height: 58)
                .font(.largeTitle)
                .foregroundColor(.black)
            Spacer()
        }
        .padding()
    }
}

struct BottomTabItemView: View {
    let title: String
    let image: String
    @Binding var selectedTab: String
    
    var isSelected: Bool {
        selectedTab == title
    }
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: image)
                .font(.system(size: 24))
                .foregroundColor(isSelected ? .black : .gray)
            
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(isSelected ? .black : .gray)
            
        }
        .onTapGesture {
            selectedTab = title
        }
    }
}

struct SelectAnimalView: View {
    let animal: String
    let image: String
    let color: Color
    @Binding var selectedAnimal: String
    
    var isSelected: Bool {
        selectedAnimal == animal
    }
    
    var body: some View {
        VStack() {
            RoundedRectangle(cornerRadius: 10)
                .fill(isSelected ? color : color.opacity(0.7))
                .frame(width: 70, height: 70)
                .padding(2)
                .overlay(
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .padding()
                )
        }
        .cornerRadius(1)
        .shadow(radius: 2)
        .onTapGesture {
            selectedAnimal = animal
        }
    }
}

struct MicroRectView: View {
    var body: some View {
        VStack {
            Image(systemName: "mic")
                .font(.system(size: 48))
                .padding(.bottom, 8)
            Text("Start Speak")
                .font(.headline)
        }
    }
}

#Preview {
    StartView()
}
