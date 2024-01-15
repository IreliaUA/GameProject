//
//  MenuViewController.swift
//  GameProject
//
//  Created by Ира on 15.01.2024.
//

import UIKit

protocol IMenuViewController: AnyObject {
  func setup(with: MenuViewModel)
}

final class MenuViewController: UIViewController {
  
  // MARK: - IBOutlet
  
  // MARK: - Properties
  
  private let presenter: IMenuPresenter
  
  // MARK: - Lifecycle
  
  init(presenter: IMenuPresenter) {
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
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        presenter.showGame()
    }
    
  
}

// MARK: - Extensions

extension MenuViewController: IMenuViewController {
  func setup(with viewModel: MenuViewModel) {
  }
}
