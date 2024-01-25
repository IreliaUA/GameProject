//
//  ResultViewModelFactory.swift
//  GameProject
//
//  Created by Ира on 16.01.2024.
//
//

import UIKit

protocol IResultViewModelFactory {
    func makeViewModel(score: Int) -> ResultViewModel
}

final class ResultViewModelFactory: IResultViewModelFactory {
    
    func makeViewModel(score: Int) -> ResultViewModel {
        let viewModel: ResultViewModel = ResultViewModel(
            loseLabel: "YOU LOSE",
            scoreLabel: "Score: \(score)",
            menuButton: "MENU",
            restartButton: "RESTART"
        )
        return viewModel
    }
}
