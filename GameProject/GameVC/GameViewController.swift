//
//  GameViewController.swift
//  GameProject
//
//  Created by Ира on 15.01.2024.
//

import UIKit
import SpriteKit
import GameplayKit

protocol IGameViewController: AnyObject {
    func showres(score: Int, closure: (() -> Void)?)
}

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "GameScene") as? GameScene {
                
                scene.scaleMode = .aspectFill
                scene.gameVC = self
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension GameViewController: IGameViewController {
    func showres(score: Int, closure: (() -> Void)?) {
        self.navigationController?.pushViewController(ResultAssembly().assemble(score: score, closure: closure), animated: true)
    }
}
