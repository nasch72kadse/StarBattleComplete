struct Puzzle {
    let gridSize: Int
    let regions: [[Int]]
    let starsPerLine: Int
    let starsPerRegion: Int
    let solution: [(Int, Int)]
}

struct SamplePuzzle {
    static let solution10x10: [(Int, Int)] = [
        (0,0), (0,2),
        (1,4), (1,6),
        (2,0), (2,2),
        (3,4), (3,8),
        (4,1), (4,6),
        (5,3), (5,8),
        (6,1), (6,5),
        (7,7), (7,9),
        (8,3), (8,5),
        (9,7), (9,9)
    ]

    /// Generates random regions for the 10x10 puzzle while keeping
    /// the star solution valid.
    static func randomPuzzle() -> Puzzle {
        let gridSize = 10
        let starPairs: [[(Int, Int)]] = stride(from: 0, to: solution10x10.count, by: 2).map {
            [solution10x10[$0], solution10x10[$0 + 1]]
        }
        let regions = generateRegions(gridSize: gridSize, starPairs: starPairs, cellsPerRegion: 10)
        return Puzzle(gridSize: gridSize,
                      regions: regions,
                      starsPerLine: 2,
                      starsPerRegion: 2,
                      solution: solution10x10)
    }

    /// Expands each star pair into a contiguous region of `cellsPerRegion`
    /// cells using a randomized flood fill.
    private static func generateRegions(gridSize: Int,
                                        starPairs: [[(Int, Int)]],
                                        cellsPerRegion: Int) -> [[Int]] {
        var regions = Array(repeating: Array(repeating: -1, count: gridSize), count: gridSize)
        var queues: [[(Int, Int)]] = Array(repeating: [], count: starPairs.count)
        var counts = Array(repeating: 0, count: starPairs.count)

        for (index, pair) in starPairs.enumerated() {
            for cell in pair {
                regions[cell.0][cell.1] = index
                queues[index].append(cell)
                counts[index] += 1
            }
        }

        let moves = [(1,0), (-1,0), (0,1), (0,-1)]
        while counts.contains(where: { $0 < cellsPerRegion }) {
            var progress = false
            for i in 0..<starPairs.count {
                guard counts[i] < cellsPerRegion else { continue }
                var nextQueue: [(Int, Int)] = []

                for cell in queues[i] {
                    guard counts[i] < cellsPerRegion else {
                        nextQueue.append(cell)
                        continue
                    }

                    var shuffledMoves = moves.shuffled()
                    let r = cell.0
                    let c = cell.1
                    while !shuffledMoves.isEmpty && counts[i] < cellsPerRegion {
                        let move = shuffledMoves.removeFirst()
                        let nr = r + move.0
                        let nc = c + move.1
                        if nr >= 0 && nr < gridSize && nc >= 0 && nc < gridSize && regions[nr][nc] == -1 {
                            regions[nr][nc] = i
                            nextQueue.append((nr, nc))
                            counts[i] += 1
                            progress = true
                        }
                    }

                    if counts[i] < cellsPerRegion {
                        nextQueue.append(cell)
                    }
                }

                queues[i] = nextQueue
            }

            if !progress {
                // If no region could expand, assign a random remaining cell
                if let r = (0..<gridSize).first(where: { row in regions[row].contains(-1) }),
                   let c = regions[r].firstIndex(of: -1) {
                    let target = counts.firstIndex(of: counts.min() ?? 0) ?? 0
                    regions[r][c] = target
                    queues[target].append((r, c))
                    counts[target] += 1
                }
            }
        }

        return regions
    }
}
