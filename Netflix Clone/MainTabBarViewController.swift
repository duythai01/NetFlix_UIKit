//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Apple on 19/07/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue
        let vc1  = UINavigationController(rootViewController: HomeViewController())
        let vc2  = UINavigationController(rootViewController: UpcomingViewController())
        let vc3  = UINavigationController(rootViewController: SearchViewController())
        let vc4  = UINavigationController(rootViewController: DownloadsViewController())
    
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "house")
        vc3.tabBarItem.image = UIImage(systemName: "house")
        vc4.tabBarItem.image = UIImage(systemName: "house")
        
        
    
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }


}

