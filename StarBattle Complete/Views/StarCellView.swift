import SwiftUI

struct StarCellView: View {
    @EnvironmentObject var viewModel: StarBattleViewModel
    let row: Int
    let column: Int

    var body: some View {
        Button(action: {
            viewModel.placeStar(atRow: row, column: column)
        }) {
            Rectangle()
                .foregroundColor(viewModel.grid[row][column] == .star ? .yellow : .gray)
                .overlay(
                    viewModel.grid[row][column] == .star
                    ? Image(systemName: "star.fill")
                        .foregroundColor(.black)
                    : nil
                )
                .frame(width: 50, height: 50)
        }
    }
}
