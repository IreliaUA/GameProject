//
//  MenuViewModelFactory.swift
//  GameProject
//
//  Created by Ира on 15.01.2024.
//
//

import UIKit

protocol IMenuViewModelFactory {
  func makeViewModel() -> MenuViewModel
}

final class MenuViewModelFactory: IMenuViewModelFactory {
  
  func makeViewModel() -> MenuViewModel {
    let viewModel: MenuViewModel = MenuViewModel()
    return viewModel
  }
}
