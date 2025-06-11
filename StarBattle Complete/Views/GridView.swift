import SwiftUI

struct GridView: View {
    @EnvironmentObject var viewModel: StarBattleViewModel
    let spacing: CGFloat = 4 // Abstand zwischen den Zellen
    
    var body: some View {
        VStack(spacing: spacing) {
            ForEach(0..<viewModel.gridSize, id: \.self) { row in
                HStack(spacing: spacing) {
                    ForEach(0..<viewModel.gridSize, id: \.self) { column in
                        CellView(row: row, column: column)
                            .environmentObject(viewModel)
                    }
                }
            }
        }
        .padding(spacing)
        .background(Color.gray)
    }
}

struct CellView: View {
    @EnvironmentObject var viewModel: StarBattleViewModel
    let row: Int
    let column: Int
    
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: 30, height: 30)
            .overlay(
                Rectangle()
                    .stroke(Color.black, lineWidth: 1)
            )
            .overlay(
                Text(viewModel.grid[row][column].displayValue)
                    .foregroundColor(.white) // Textfarbe, um den Inhalt sichtbar zu machen
            )
            .onTapGesture {
                viewModel.placeStar(atRow: row, column: column)
            }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .environmentObject(StarBattleViewModel(gridSize: 5))
            .previewLayout(.sizeThatFits)
    }
}
