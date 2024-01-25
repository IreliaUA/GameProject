//
//  MenuRouter.swift
//  GameProject
//
//  Created by Ира on 15.01.2024.
//
//

import UIKit

protocol IMenuRouter {
    func showGame()
    func showResult(closure: (() -> Void)?)
}

final class MenuRouter: IMenuRouter {
    
    weak var transitionHandler: UIViewController?
    private let resultVCAssembly: IResultAssembly
    
    init(resultVCAssembly: IResultAssembly) {
        self.resultVCAssembly = resultVCAssembly
    }
    
    func showGame() {
        let gameViewController = GameViewController()
        //            gameViewController.navigationItem.hidesBackButton = true
        transitionHandler?.navigationController?.pushViewController(gameViewController, animated: true)
        //        transitionHandler?.navigationController?.pushViewController(GameViewController(), animated: true)
    }
    func showResult(closure: (() -> Void)?) {
        let resutVC = resultVCAssembly.assemble(score: 0, closure: closure)
        resutVC.navigationItem.hidesBackButton = true
        transitionHandler?.navigationController?.pushViewController(resutVC, animated: true)
    }
}
