import Foundation

// Das Model ist hier direkt im ViewModel integriert, daher ist keine separate Datei nötig. Wenn du jedoch ein separates Modell haben möchtest, könntest du es so definieren:

struct StarBattleModel {
    var grid: [[CellState]]
    let gridSize: Int
    
    init(gridSize: Int) {
        self.gridSize = gridSize
        self.grid = Array(repeating: Array(repeating: .empty, count: gridSize), count: gridSize)
    }
}
