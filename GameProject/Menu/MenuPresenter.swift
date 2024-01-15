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
  var viewModel: MenuViewModel? { get }
}

final class MenuPresenter: IMenuPresenter {
  
  /*
   // MARK: - Presenter
   Presenter - this class implements the interaction between the Model and the View and contains all the logic.
   Presenter can implement actions, class or service methods.
  */
  
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
}
