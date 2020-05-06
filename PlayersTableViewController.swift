//
//  PlayersTableViewController.swift
//  AzureMLApp
//
//  Created by Mallika Sansgiri on 3/22/20.
//  Copyright © 2020 Mallika Sansgiri. All rights reserved.
//

import UIKit

class PlayersTableViewController: UITableViewController, UITextFieldDelegate{

    var rowNum : Int = 0
    var use = 0
    var allCellsText : [String] = []
    var head : [String] = []
    var count = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        print(rowNum)
       use = rowNum
        allCellsText = [String](repeating: "no name", count: rowNum)
        head = [String](repeating: "player", count: rowNum)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    @IBAction func next(_ sender: Any) {
        let displayVC : GameViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "game") as! GameViewController
        displayVC.playerName = allCellsText
        
        self.present(displayVC, animated: true, completion: nil)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rowNum
        
    }

    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "player", for: indexPath as IndexPath) as!
    CustomTableViewCell

        // Configure the cell...

    cell.textLab?.delegate = self 
    cell.textLab?.text = ""
    cell.textLab?.placeholder = "Player "  + String(indexPath.row + 1)
    cell.textLab?.autocorrectionType = UITextAutocorrectionType.no
    cell.textLab?.autocapitalizationType = UITextAutocapitalizationType.none
    cell.textLab?.adjustsFontSizeToFitWidth = true
    cell.textLabel!.textColor  = UIColor.init(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
    return cell
    }
    
  

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        for i in 0...(rowNum - 1)  {
            head[i] = "Player " + String(i + 1)
        }
        let indexOf = head.index(of:textField.placeholder!)
        //print(indexOf)
        // if(textField.placeholder! == animals[indexOf!]){
        // if( indexOf! <= (allCellsText.count - 1)){
        //     allCellsText.remove(at: indexOf!)
        //    }
        if textField.text != nil {
           // print(String(indexOf!))
            allCellsText[indexOf!] = textField.text! //text(textField.text!, at: indexOf!)
        }
       
        
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
