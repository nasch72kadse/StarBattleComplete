import SwiftUI

class StarBattleViewModel: ObservableObject {
    @Published var grid: [[CellState]]
    let gridSize: Int
    let regions: [[Int]]
    let starsPerLine: Int
    let starsPerRegion: Int

    init(gridSize: Int,
         regions: [[Int]],
         starsPerLine: Int = 2,
         starsPerRegion: Int = 1) {
        self.gridSize = gridSize
        self.regions = regions
        self.starsPerLine = starsPerLine
        self.starsPerRegion = starsPerRegion
        self.grid = Array(repeating: Array(repeating: .empty, count: gridSize), count: gridSize)
    }

    func placeStar(atRow row: Int, column: Int) {
        switch grid[row][column] {
        case .empty:
            grid[row][column] = .cross
        case .cross:
            if canPlaceStar(atRow: row, column: column) {
                grid[row][column] = .star
            }
        case .star:
            grid[row][column] = .empty
        }
    }
    
    func resetGrid() {
        grid = Array(repeating: Array(repeating: .empty, count: gridSize), count: gridSize)
    }

    // MARK: - Rule Checking

    private func canPlaceStar(atRow row: Int, column: Int) -> Bool {
        guard grid[row][column] != .star else { return false }
        return !hasAdjacentStar(row: row, column: column) &&
            starCountInRow(row) < starsPerLine &&
            starCountInColumn(column) < starsPerLine &&
            starCountInRegion(regionIndex(row: row, column: column)) < starsPerRegion
    }

    private func hasAdjacentStar(row: Int, column: Int) -> Bool {
        for r in max(0, row-1)...min(gridSize-1, row+1) {
            for c in max(0, column-1)...min(gridSize-1, column+1) {
                if r == row && c == column { continue }
                if grid[r][c] == .star { return true }
            }
        }
        return false
    }

    private func starCountInRow(_ row: Int) -> Int {
        grid[row].filter { $0 == .star }.count
    }

    private func starCountInColumn(_ column: Int) -> Int {
        grid.map { $0[column] }.filter { $0 == .star }.count
    }

    private func starCountInRegion(_ region: Int) -> Int {
        var count = 0
        for r in 0..<gridSize {
            for c in 0..<gridSize {
                if regions[r][c] == region && grid[r][c] == .star {
                    count += 1
                }
            }
        }
        return count
    }

    private func regionIndex(row: Int, column: Int) -> Int {
        regions[row][column]
    }

    func isSolved() -> Bool {
        for i in 0..<gridSize {
            if starCountInRow(i) != starsPerLine { return false }
            if starCountInColumn(i) != starsPerLine { return false }
        }

        let uniqueRegions = Set(regions.flatMap { $0 })
        for region in uniqueRegions {
            if starCountInRegion(region) != starsPerRegion { return false }
        }

        // check adjacency rule
        for r in 0..<gridSize {
            for c in 0..<gridSize {
                if grid[r][c] == .star && hasAdjacentStar(row: r, column: c) {
                    return false
                }
            }
        }

        return true
    }
}

enum CellState {
    case empty
    case star
    case cross

    var displayValue: String {
        switch self {
        case .empty:
            return ""
        case .star:
            return "⭐"
        case .cross:
            return "X"
        }
    }
}
