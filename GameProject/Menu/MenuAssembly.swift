//
//  MenuAssembly.swift
//  GameProject
//
//  Created by Ира on 15.01.2024.
//
//

import UIKit

protocol IMenuAssembly {
    func assemble() -> UIViewController
}

final class MenuAssembly: IMenuAssembly {
    
    // Dependencies
    private let viewModelFactory: IMenuViewModelFactory
    private let resultVCAssembly: IResultAssembly
    // other services...
    
    // MARK: - Initialization
    
    init(
        viewModelFactory: IMenuViewModelFactory = MenuViewModelFactory(),
        resultVCAssembly: IResultAssembly = ResultAssembly()
    ) {
        self.viewModelFactory = viewModelFactory
        self.resultVCAssembly = resultVCAssembly
    }
    
    // MARK: - IMenuAssembly
    
    func assemble() -> UIViewController {
        let router: MenuRouter = MenuRouter(resultVCAssembly: resultVCAssembly)
        let presenter: MenuPresenter = MenuPresenter(
            viewModelFactory: viewModelFactory,
            router: router
        )
        
        let viewController: MenuViewController = MenuViewController(presenter: presenter)
        presenter.view = viewController
        router.transitionHandler = viewController
        
        return viewController
    }
}
