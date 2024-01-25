//
//  MenuPresenter.swift
//  GameProject
//
//  Created by Ира on 15.01.2024.
//
//

import UIKit

protocol IMenuPresenter {
    func viewDidLoad()
    func showGame()
    func showResult()
    var viewModel: MenuViewModel? { get }
}

final class MenuPresenter: IMenuPresenter {
    
    // Dependencies
    weak var view: IMenuViewController?
    private let viewModelFactory: IMenuViewModelFactory
    private let router: IMenuRouter
    
    // MARK: - Initialization
    
    init(
        viewModelFactory: IMenuViewModelFactory,
        router: IMenuRouter
    ) {
        self.viewModelFactory = viewModelFactory
        self.router = router
    }
    
    // MARK: - IMenuPresenter
    
    var viewModel: MenuViewModel?
    
    func viewDidLoad() {
        let createdViewModel = viewModelFactory.makeViewModel()
        viewModel = createdViewModel
        view?.setup(with: createdViewModel)
    }
    
    func showGame() {
        router.showGame()
    }
    func showResult(){
        //  router.showResult()
    }
}

