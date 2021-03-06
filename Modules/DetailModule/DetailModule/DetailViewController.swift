//
//  DetailViewController.swift
//  Router
//
//  Created by LYP on 2019/2/17.
//  Copyright © 2019 LYP. All rights reserved.
//

import UIKit
import Router
import ShareRouter

class DetailViewController: UIViewController {

    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Detail-\(id ?? 0)"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Alert", style: .done, target: self, action: #selector(showAlert))
    }
    
    @objc func showAlert() {
        Router.default.router(to: ShareRouter.showAlert(title: "Detail", message: "This is some description"))
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
