//
//  ResultPresenter.swift
//  GameProject
//
//  Created by Ира on 16.01.2024.
//
//

import UIKit

protocol IResultPresenter {
    func viewDidLoad()
    func showMenu()
    func restartGame()
    var viewModel: ResultViewModel? { get }
}

final class ResultPresenter: IResultPresenter {
    
    weak var view: IResultViewController?
    private let viewModelFactory: IResultViewModelFactory
    private let router: IResultRouter
    private var score: Int
    private let closure: (() -> Void)?
    // MARK: - Initialization
    
    init(
        viewModelFactory: IResultViewModelFactory,
        router: IResultRouter,
        score: Int,
        closure: (() -> Void)?
    ) {
        self.viewModelFactory = viewModelFactory
        self.router = router
        self.score = score
        self.closure = closure
    }
    
    // MARK: - IResultPresenter
    
    var viewModel: ResultViewModel?
    
    func viewDidLoad() {
        let createdViewModel = viewModelFactory.makeViewModel(score: score)
        viewModel = createdViewModel
        view?.setup(with: createdViewModel)
    }
    
    func showMenu(){
        router.showMenu()
    }
    func restartGame() {
        closure?()
        router.restartGame()
    }
}
