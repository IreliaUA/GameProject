//
//  ResultPresenter.swift
//  GameProject
//
//  Created by Ира on 16.01.2024.
//
//

import UIKit

protocol IResultPresenter {
  func viewDidLoad()
    func showMenu()
  var viewModel: ResultViewModel? { get }
}

final class ResultPresenter: IResultPresenter {
  
  // Dependencies
  weak var view: IResultViewController?
  private let viewModelFactory: IResultViewModelFactory
  private let router: IResultRouter
  
  // MARK: - Initialization
  
  init(
    viewModelFactory: IResultViewModelFactory,
    router: IResultRouter
  ) {
    self.viewModelFactory = viewModelFactory
    self.router = router
  }
  
  // MARK: - IResultPresenter
  
  var viewModel: ResultViewModel?
  
  func viewDidLoad() {
    let createdViewModel = viewModelFactory.makeViewModel()
    viewModel = createdViewModel
    view?.setup(with: createdViewModel)
  }
    func showMenu(){
        router.showMenu()
    }
}
