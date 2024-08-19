import SwiftUI

struct MainScreenView: View {
    var body: some View {
        VStack {
            Text("Star Battle")
                .font(.largeTitle)
                .padding()

            NavigationLink(destination: GameView()) {
                Text("Start Game")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("Main Menu")
    }
}
