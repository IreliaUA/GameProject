//
//  ResultAssembly.swift
//  GameProject
//
//  Created by Ира on 16.01.2024.
//
//

import UIKit

protocol IResultAssembly {
    func assemble(score: Int, closure: (() -> Void)?) -> UIViewController
}

final class ResultAssembly: IResultAssembly {
    
    private let viewModelFactory: IResultViewModelFactory
    
    // MARK: - Initialization
    
    init(viewModelFactory: IResultViewModelFactory = ResultViewModelFactory()
    ) {
        self.viewModelFactory = viewModelFactory
    }
    
    // MARK: - IResultAssembly
    
    func assemble(score: Int, closure: (() -> Void)?) -> UIViewController {
        let router: ResultRouter = ResultRouter()
        let presenter: ResultPresenter = ResultPresenter(
            viewModelFactory: viewModelFactory,
            router: router,
            score: score,
            closure: closure
        )
        
        let viewController: ResultViewController = ResultViewController(presenter: presenter)
        presenter.view = viewController
        router.transitionHandler = viewController
        
        return viewController
    }
}
