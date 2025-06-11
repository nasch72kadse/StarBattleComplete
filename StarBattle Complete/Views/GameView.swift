import SwiftUI

struct GameView: View {
    @StateObject var viewModel = StarBattleViewModel(
        gridSize: 10,
        regions: SamplePuzzle.regions10x10,
        starsPerLine: 2,
        starsPerRegion: 2
    )

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

            if viewModel.isSolved() {
                Text("Puzzle solved!")
                    .foregroundColor(.green)
                    .padding()
            }
        }
        .navigationTitle("Star Battle")
    }
}
