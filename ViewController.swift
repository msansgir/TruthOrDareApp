//
//  ViewController.swift
//  AzureMLApp
//
//  Created by Mallika Sansgiri on 7/2/19.
//  Copyright © 2019 Mallika Sansgiri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let leftSwipe = UISwipeGestureRecognizer(target:self, action:  #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        view.addGesureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer) {
        if(sender.direction == .left) {
            print("Left Swipe")
        
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Login") as!
            LoginViewController
            self.present(nextViewController, animated:true, completion:nil)
            
        }
        
        
        
        
    }


}

