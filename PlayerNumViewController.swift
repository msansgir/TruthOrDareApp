//
//  PlayerNumViewController.swift
//  AzureMLApp
//
//  Created by Mallika Sansgiri on 3/21/20.
//  Copyright © 2020 Mallika Sansgiri. All rights reserved.
//

import UIKit

class PlayerNumViewController: UIViewController {

    var playernum = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func next(){
        let displayVC : PlayersTableViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "final") as! PlayersTableViewController
        displayVC.rowNum = playernum
        
        self.present(displayVC, animated: true, completion: nil)
       
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "final") as! PlayersTableViewController
        self.present(nextViewController, animated:true, completion:nil)
        
       
        
        
    }
    
    @IBAction func two(_ sender: Any) {
        playernum = 2
        next()
    }
    
    @IBAction func three(_ sender: Any) {
         playernum = 3
        next()
    }
    @IBAction func four(_ sender: Any) {
         playernum = 4
        next()
    }
    @IBAction func five(_ sender: Any) {
         playernum = 5
        next()
    }
    @IBAction func six(_ sender: Any) {
         playernum = 6
        next()
    }
    @IBAction func seven(_ sender: Any) {
         playernum = 7
        next()
    }
    @IBAction func eight(_ sender: Any) {
         playernum = 8
        next()
    }
    @IBAction func nine(_ sender: Any) {
         playernum = 9
        next()
    }
    @IBAction func ten(_ sender: Any) {
         playernum = 10
        next()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is PlayersTableViewController {
            let dv = segue.destination as! PlayersTableViewController
            dv.rowNum = playernum
            
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
