import SwiftUI

struct GameView: View {
    @StateObject var viewModel = StarBattleViewModel(gridSize: 5) // Beispiel für ein 5x5 Gitter

    var body: some View {
        VStack {
            Text("Game Screen")
                .font(.title)
                .padding()

            GridView()
                .environmentObject(viewModel)
                .padding()

            Button(action: {
                viewModel.resetGrid()
            }) {
                Text("Reset")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("Star Battle")
    }
}
