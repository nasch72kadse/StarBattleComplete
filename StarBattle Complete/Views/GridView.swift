import SwiftUI

struct GridView: View {
    @EnvironmentObject var viewModel: StarBattleViewModel

    var body: some View {
        // Berechne die Spalten direkt im body
        let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: viewModel.gridSize)

        ZStack {
            // Schwarze Umrandung um das gesamte Projekt
            Rectangle()
                .stroke(Color.black, lineWidth: 2)
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(0..<viewModel.gridSize, id: \.self) { row in
                    ForEach(0..<viewModel.gridSize, id: \.self) { column in
                        StarCellView(row: row, column: column)
                            .background(Color.gray)
                            .border(Color.black, width: 1) // Graue Balken und schwarze Umrandung zwischen Zellen
                    }
                }
            }
        }
    }
}
