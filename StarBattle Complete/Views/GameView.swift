import SwiftUI

struct GameView: View {
    @StateObject private var viewModel: StarBattleViewModel

    init() {
        let puzzle = SamplePuzzle.randomPuzzle()
        _viewModel = StateObject(wrappedValue: StarBattleViewModel(puzzle: puzzle))
    }

    var body: some View {
        ZStack {
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
            if viewModel.isSolved() {
                ConfettiView()
                    .ignoresSafeArea()
            }
        }
        .navigationTitle("Star Battle")
    }
}
