//
//  ResultViewModelFactory.swift
//  GameProject
//
//  Created by Ира on 16.01.2024.
//
//

import UIKit

protocol IResultViewModelFactory {
  func makeViewModel() -> ResultViewModel
}

final class ResultViewModelFactory: IResultViewModelFactory {
  
  func makeViewModel() -> ResultViewModel {
    let viewModel: ResultViewModel = ResultViewModel()
    return viewModel
  }
}
