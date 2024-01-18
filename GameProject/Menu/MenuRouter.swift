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
    func showResult()
}

final class MenuRouter: IMenuRouter {
    
    weak var transitionHandler: UIViewController?
    private let resultVCAssembly: IResultAssembly

    init(resultVCAssembly: IResultAssembly) {
        self.resultVCAssembly = resultVCAssembly
    }
    
    func showGame() {
        transitionHandler?.navigationController?.pushViewController(GameViewController(), animated: true)
    }
    func showResult() {
        let resutVC = resultVCAssembly.assemble()
        resutVC.navigationItem.hidesBackButton = true
        transitionHandler?.navigationController?.pushViewController(resutVC, animated: true)
    }
    
}
