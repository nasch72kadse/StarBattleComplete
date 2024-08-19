import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: StarBattleViewModel

    var body: some View {
        VStack {
            Text("Star Battle")
                .font(.largeTitle)
                .padding()

            GridView()
                .padding()
            
            Button(action: {
                viewModel.resetGrid()
            }) {
                Text("Reset")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}
