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
    
    @IBOutlet weak var loseLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var loseView: UIView!
    
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
        navigationItem.hidesBackButton = true
        loseView.layer.cornerRadius = 60
        
        menuButton.layer.cornerRadius = 14
        menuButton.layer.shadowColor = UIColor.black.cgColor
        menuButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        menuButton.layer.shadowOpacity = 0.3
        menuButton.layer.shadowRadius = 4
        
        restartButton.layer.cornerRadius = 14
        restartButton.layer.shadowColor = UIColor.black.cgColor
        restartButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        restartButton.layer.shadowOpacity = 0.3
        restartButton.layer.shadowRadius = 4
    }
    
    // MARK: - IBActions
    
    @IBAction func restartButtonAction(_ sender: UIButton) {
        presenter.restartGame()
    }
    @IBAction func menuButtonAction(_ sender: UIButton) {
        presenter.showMenu()
    }
}
// MARK: - Extensions

extension ResultViewController: IResultViewController {
    func setup(with viewModel: ResultViewModel) {
        loseLabel.text = viewModel.loseLabel
        scoreLabel.text = viewModel.scoreLabel
        menuButton.setTitle(viewModel.menuButton, for: .normal)
        restartButton.setTitle(viewModel.restartButton, for: .normal)
    }
}
