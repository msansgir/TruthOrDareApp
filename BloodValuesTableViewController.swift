//
//  BloodValuesTableViewController.swift
//  AzureMLApp
//
//  Created by Mallika Sansgiri on 7/22/19.
//  Copyright © 2019 Mallika Sansgiri. All rights reserved.
//

import UIKit

class BloodValuesTableViewController: UITableViewController, UITextFieldDelegate {

    var values : [String]?
    var whole : [String]?
    var specific : [String] = [String]()
    var count1 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print(values!)
        count1 = values!.count
        for j in 0...values!.count - 1 {
        for i in 0...whole!.count - 1 {
            
            if values![j] == whole![i].components(separatedBy: " ")[0] {
                
                specific.append(whole![i])
                
            }
            
        }
        }
        
    print(specific)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
var allCellsText = [String](repeating: "noData", count: 115)
    func textFieldDidEndEditing(_ textField: UITextField) {
        let indexOf = values!.index(of:textField.placeholder!)
        //print(indexOf)
        // if(textField.placeholder! == animals[indexOf!]){
        // if( indexOf! <= (allCellsText.count - 1)){
        //     allCellsText.remove(at: indexOf!)
        //    }
        if textField.text != nil {
           print(String(indexOf!))
            allCellsText[indexOf!] = textField.text! //text(textField.text!, at: indexOf!)
        }
        
        
      
      
        //  }
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return values!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bloodvalues", for: indexPath as IndexPath) as! InputTableViewCell
        
        cell.textLab?.delegate = self
        cell.textLab?.text = ""
        cell.textLab?.placeholder = values![indexPath.row]
        cell.textLab?.autocorrectionType = UITextAutocorrectionType.no
        cell.textLab?.autocapitalizationType = UITextAutocapitalizationType.none
        cell.textLab?.adjustsFontSizeToFitWidth = true
        let team = values![indexPath.row]
        cell.textLabel!.text = team
        cell.textLabel!.textColor  = UIColor.init(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        

        // Configure the cell...

        return cell
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

  
    func level() -> [String] {
        var list : [String] = [String]()
        
        print(specific)
        for i in 0...specific.count - 1 {
            if allCellsText[i] != "noData" {
                var y :Double  = Double(allCellsText[i])!
                
                let range1 = Double(specific[i].components(separatedBy: " ")[1])!
                var range2 = Double(specific[i].components(separatedBy: " ")[3])!
                var val = ""
                
                if y > range2 {
                    val = "high"
                } else if y < range1 {
                    val = "low"
                }else if y >= range1 && y <= ((range1 * 0.1) + range1) {
                    val = "low_warning"
                } else if y <= range2 && y >= ((range2 * 0.1) + range2 ) {
                    val = "high_warning"
                }else {
                    val = "normal"
                }
                
                list.append("Your " + specific[i].components(separatedBy: " ")[0] + " is " + val.replacingOccurrences(of: "_", with: " "))
            }else {
                
                list.append("noData")
            }
        }
        
        return list
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var guess : [String]?
        if segue.destination is BloodEvalTableViewController {
            guess = level()
            let displayVC = segue.destination as! BloodEvalTableViewController
            displayVC.listWeUse = guess
            //displayVC.chosen = allCellsText
            //displayVC.increment = specific
        }
        
         
    }
    
    
}
