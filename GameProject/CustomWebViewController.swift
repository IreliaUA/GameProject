//
//  CustomWebViewController.swift
//  GameProject
//
//  Created by Ира on 25.01.2024.
//

import UIKit

class CustomWebViewController: UIViewController {

    @IBOutlet weak var webViewElement: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: "https://www.google.com") {
               let request = URLRequest(url: url)
            webViewElement.loadRequest(request)
           }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
