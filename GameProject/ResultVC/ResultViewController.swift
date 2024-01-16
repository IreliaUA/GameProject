//
//  ResultViewController.swift
//  GameProject
//
//  Created by Ира on 16.01.2024.
//

import UIKit

protocol IResultViewController: AnyObject {
  func setup(with: ResultViewModel)
}

final class ResultViewController: UIViewController {
  
  // MARK: - IBOutlet
  
  // MARK: - Properties
  
  private let presenter: IResultPresenter
  
  // MARK: - Lifecycle
  
  init(presenter: IResultPresenter) {
    self.presenter = presenter
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    presenter.viewDidLoad()
  }
  
  // MARK: - Private Methods
  
  private func setupUI() {
  }
  
  // MARK: - IBActions
  
}

// MARK: - Extensions

extension ResultViewController: IResultViewController {
  func setup(with viewModel: ResultViewModel) {
  }
}
