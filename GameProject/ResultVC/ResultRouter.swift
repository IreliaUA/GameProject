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
}

final class ResultRouter: IResultRouter {
    
    weak var transitionHandler: UIViewController?
    
    
    init() {
        
    }
    
    func showNextScreen() {
    }
    
    func showMenu() {
        transitionHandler?.navigationController?.popToRootViewController(animated: true)
//        let menuVC = menuVCAssembly.assemble()
//        menuVC.navigationItem.hidesBackButton = true
//        transitionHandler?.navigationController?.pushViewController(menuVC, animated: true)
    }
}
