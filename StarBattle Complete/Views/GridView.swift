import SwiftUI

struct GridView: View {
    @EnvironmentObject var viewModel: StarBattleViewModel

    var body: some View {
        // Berechne die Spalten direkt im body
        let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: viewModel.gridSize)

        ZStack {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(0..<viewModel.gridSize, id: \.self) { row in
                    ForEach(0..<viewModel.gridSize, id: \.self) { column in
                        StarCellView(row: row, column: column)
                            .background(Color.gray)
                            .border(Color.black, width: 0.5) // Dünnere schwarze Linien zwischen den Zellen
                    }
                }
            }
            .padding(0.5) // Dünnerer Abstand für die äußere Umrandung
            .background(Color.black) // Schwarzer Rahmen um das gesamte Gitter
        }
    }
}
