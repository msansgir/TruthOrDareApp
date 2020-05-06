//
//  ScoreTableViewController.swift
//  AzureMLApp
//
//  Created by Mallika Sansgiri on 3/23/20.
//  Copyright © 2020 Mallika Sansgiri. All rights reserved.
//

import UIKit

class ScoreTableViewController: UITableViewController {

    var playerNam : [String] = []
    var listOfScore : [Int] = []
    var cunty = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(playerNam)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playerNam.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "baz", for: indexPath as IndexPath) as!
        WhyTableViewCell
        
        cell.textLabel!.text = playerNam[indexPath.row]
        cell.scoreLabel.text = String(listOfScore[indexPath.row])
        cell.scoreLabel.textColor = UIColor.black
        

        return cell
    }
    
    
    
    @IBAction func continueGame(_ sender: Any) {
        let displayVC : GameViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "game") as! GameViewController
        displayVC.count = cunty
        displayVC.playerName = playerNam
        displayVC.scoreL = listOfScore
        self.present(displayVC, animated: true, completion: nil)
    }
    @IBAction func EndGame(_ sender: Any) {
        let displayVC : WinnerViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "winner") as! WinnerViewController
        displayVC.players = playerNam
        displayVC.scores = listOfScore
        self.present(displayVC, animated: true, completion: nil)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
