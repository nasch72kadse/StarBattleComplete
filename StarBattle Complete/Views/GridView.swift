import SwiftUI

struct GridView: View {
    @EnvironmentObject var viewModel: StarBattleViewModel

    var body: some View {
        // Berechne die Spalten direkt im body
        let columns = Array(repeating: GridItem(.flexible()), count: viewModel.gridSize)

        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(0..<viewModel.gridSize, id: \.self) { row in
                ForEach(0..<viewModel.gridSize, id: \.self) { column in
                    StarCellView(row: row, column: column)
                }
            }
        }
    }
}
