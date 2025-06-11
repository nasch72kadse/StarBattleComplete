struct SamplePuzzle {
    static let regions5x5: [[Int]] = [
        [0,0,1,1,2],
        [0,0,1,1,2],
        [3,3,3,4,2],
        [3,3,4,4,2],
        [3,4,4,4,2]
    ]

    // 10x10 puzzle where each row acts as its own region. This keeps
    // the example simple and guarantees that two stars per row, column
    // and region are possible.
    static let regions10x10: [[Int]] = (0..<10).map { row in
        Array(repeating: row, count: 10)
    }

    /// Known star positions that solve `regions10x10`. Coordinates use
    /// zero-based indexing.
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
}
