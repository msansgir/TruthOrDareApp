//
//  WinnerViewController.swift
//  AzureMLApp
//
//  Created by Mallika Sansgiri on 3/24/20.
//  Copyright © 2020 Mallika Sansgiri. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    var players : [String] = []
     
    @IBOutlet weak var winn: UILabel!
    var scores : [Int] = []
    @IBOutlet weak var Ranking: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.Ranking.delegate = self
        self.Ranking.dataSource = self
        //print(greatest())
        winn.text = "Good Job " + greatest()[0]
 
        // Do any additional setup after loading the view.
    }
    
   
    
    func greatest() -> [String] {
        var great = scores.sorted()
        var score = great[0]
        
       // var count = 0
        var newList : [String] = [String](repeating: "no name", count: players.count)
       print(scores)
        //var num = 0
        for j in 0 ... (scores.count - 1){
        for i in 0 ... (scores.count - 1) {
            var score = great[j]
            if score == scores[i]{
               
                newList[scores.count - ( j + 1 )] = players[i]
                
                //score = great[j]
                
            }
        }
        }
        return newList
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath as IndexPath) as!
        DamnTableViewCell
       
        if indexPath.row == 0 {
            cell.textLabel!.text = greatest()[0]
            cell.damn?.text = String(scores.sorted()[scores.count - 1 - 0])
            cell.textLabel?.textColor = UIColor.green
            cell.damn?.textColor = UIColor.green
          
        }else if indexPath.row == (scores.count - 1 ){
        cell.textLabel!.text = greatest()[scores.count - 1]
        cell.damn?.text = String(scores.sorted()[scores.count - 1 - (scores.count - 1)])
            cell.textLabel?.textColor = UIColor.red
            cell.damn?.textColor = UIColor.red
        }else {
            cell.textLabel!.text = greatest()[indexPath.row]
            cell.damn?.text = String(scores.sorted()[scores.count - 1 - indexPath.row])
            cell.textLabel?.textColor = UIColor.black
            cell.damn?.textColor = UIColor.black
            
        }
        
        return cell
        
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
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
