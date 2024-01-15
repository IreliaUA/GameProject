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
}

final class MenuRouter: IMenuRouter {
  
  weak var transitionHandler: UIViewController?
  
  func showGame() {
      transitionHandler?.navigationController?.pushViewController(GameViewController(), animated: true)
  }
}
