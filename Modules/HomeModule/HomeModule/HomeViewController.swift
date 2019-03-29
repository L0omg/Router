//
//  HomeViewController.swift
//  Router
//
//  Created by LYP on 2019/2/17.
//  Copyright © 2019 LYP. All rights reserved.
//

import UIKit
import Router
import DetailRouter
import ShareRouter

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "home"
        view.backgroundColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Hello", style: .done, target: self, action: #selector(sayHello))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Detail", style: .done, target: self, action: #selector(toDetail))
    }
    
    @objc func sayHello() {
        Router.default.router(to: ShareRouter.sayHi)
    }
    
    @objc func toDetail() {
        Router.default.push(to: DetailRouter.detail(id: Int.random(in: 1000...9999)))
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
