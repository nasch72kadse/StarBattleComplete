//
//  StarBattle_CompleteTests.swift
//  StarBattle CompleteTests
//
//  Created by Lukas von Ehr on 18.08.24.
//

import Testing
@testable import StarBattle_Complete

struct StarBattle_CompleteTests {

    @Test func puzzleSolvable() async throws {
        let viewModel = StarBattleViewModel(
            gridSize: 10,
            regions: SamplePuzzle.regions10x10,
            starsPerLine: 2,
            starsPerRegion: 2
        )

        for (row, col) in SamplePuzzle.solution10x10 {
            viewModel.grid[row][col] = .star
        }

        #expect(viewModel.isSolved())
    }

}
