//
//  ResultRouter.swift
//  GameProject
//
//  Created by Ира on 16.01.2024.
//
//

import UIKit

protocol IResultRouter {
    func showNextScreen()
    func showMenu()
    func restartGame()
}

final class ResultRouter: IResultRouter {
    
    weak var transitionHandler: UIViewController?
    
    init() {
    }
    
    func showNextScreen() {
    }
    
    func restartGame(){
        transitionHandler?.navigationController?.popViewController(animated: true)
    }
    
    func showMenu() {
        transitionHandler?.navigationController?.popToRootViewController(animated: true)
//                let menuVC = menuVCAssembly.assemble()
//                menuVC.navigationItem.hidesBackButton = true
        //        transitionHandler?.navigationController?.pushViewController(menuVC, animated: true)
    }
}
