import SwiftUI
import Speech

struct ResultSpeechView: View {
    @State private var returnToStartView: Bool = false
    @Binding var selectedAnimal: String
    @ObservedObject private var speechAnalyzer = SpeechAnalyzer()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                GradientView()
            }
            
            TitleView(title: "Result")
            
            Button(action: {
                returnToStartView = true
            }) {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 48, height: 48)
                        .shadow(radius: 3)
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 2))
                        .fill(Color.black).opacity(0.8)
                        .frame(width: 28, height: 28)
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.system(size: 10, weight: .bold))
                }
                .position(x: 1 + 40, y: 1 + 45)
            }
            .buttonStyle(PlainButtonStyle())
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.theme.settingCellViewLightBlue)
                    .frame(width: 291, height: 142)
                    .shadow(radius: 3)
                Text(speechAnalyzer.recognizedText ?? "Tap the \(selectedAnimal) to start")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
            }
            .position(x: 1 + 203, y: 1 + 250)
            
            ZStack {
                Button {
                    toggleSpeechRecognition()
                } label : {
                    Image("\(selectedAnimal)")
                        .resizable()
                        .frame(width: 184, height: 184)
                        .position(x: 203, y: 550)
                }
                .buttonStyle(PlainButtonStyle())
            }
            if returnToStartView {
                StartView()
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

private extension ResultSpeechView {
    func toggleSpeechRecognition() {
        if speechAnalyzer.isProcessing {
            speechAnalyzer.stop()
        } else {
            speechAnalyzer.start()
        }
    }
}

#Preview {
    ResultSpeechView(selectedAnimal: .constant("dog"))
}
