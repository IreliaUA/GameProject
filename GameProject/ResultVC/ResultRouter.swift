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
}

final class ResultRouter: IResultRouter {
  
  weak var transitionHandler: UIViewController?
  
  /*
   // MARK: - Router
   Router - this class is used to implement the transition functionality and show other screens.
   Use an initializer for injection assembly other screens, and transitionHandler as the screen from which the next screen will be shown
   
   init(nextScreenAssembly: InextScreenAssembly) {
      self.nextScreenAssembly = nextScreenAssembly
   }
   */
  
  func showNextScreen() {
  }
}
