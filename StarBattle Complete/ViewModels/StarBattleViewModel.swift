import SwiftUI

class StarBattleViewModel: ObservableObject {
    @Published var grid: [[CellState]]
    let gridSize: Int

    init(gridSize: Int) {
        self.gridSize = gridSize
        self.grid = Array(repeating: Array(repeating: .empty, count: gridSize), count: gridSize)
    }
    
    func placeStar(atRow row: Int, column: Int) {
        if grid[row][column] == .empty {
            grid[row][column] = .cross
        } else if grid[row][column] == .cross {
            grid[row][column] = .star
        }
        else {
            grid[row][column] = .empty
        }
    }
    
    func resetGrid() {
        grid = Array(repeating: Array(repeating: .empty, count: gridSize), count: gridSize)
    }
}

enum CellState {
    case empty
    case star
    case cross
}
