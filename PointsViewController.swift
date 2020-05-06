//
//  PointsViewController.swift
//  AzureMLApp
//
//  Created by Mallika Sansgiri on 3/23/20.
//  Copyright © 2020 Mallika Sansgiri. All rights reserved.
//

import UIKit

class PointsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    

    var playerN : [String] = []
    var yayOrNay = 0
    var truthOrDare = ""
    var c = 0;
    var spinCount = 0
    var pickerData : [[String]] = [[String]]()
    var scoreList : [Int] = []
   
    @IBOutlet weak var plus: UILabel!
    @IBOutlet weak var congrats: UILabel!
    @IBOutlet weak var spinner: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spinner.delegate = self
        self.spinner.dataSource = self
    //    spinner.setValue(UIColor.init(red: 0/255, green: 98/255, blue: 8/255, alpha: 1), forKey: "textColor")
       
        
        if truthOrDare == "truth" {
            pickerData = [["10", "20", "40", "10", "0", "20", "10", "0", "30","10", "20", "40", "10", "0", "20", "10", "0", "30"], ["10", "5", "50", "5", "0", "5", "0", "10", "20", "30","10", "20", "40", "10", "0", "20", "10", "0", "30"], ["10", "0", "20", "15", "0", "10", "20", "0", "15", "5","10", "20", "20", "10", "30", "40", "0", "0", "30"] ]
        }else {
            pickerData = [["10", "30", "20", "5", "50", "10", "20", "20", "100", "15","10", "30", "20", "5", "50", "10", "20", "20", "10", "15"], ["10", "5", "60", "5", "10", "0", "20", "5", "0","100", "30", "20", "5", "50", "10", "20", "20", "10", "15"], ["10", "10", "30", "5", "10", "50", "20", "5", "20","100", "30", "20", "15", "50", "10", "0", "20", "30", "15"] ]
        }
        if yayOrNay == 1 {
        congrats.text = "Congratulations " + playerN[c % playerN.count]
       plus.text = "Spin to win some points"
            
        } else {
            congrats.text = "Boo " + playerN[c % playerN.count]
            plus.text = "No spin for you"
            
        }
        if c == 0 {
        scoreList = [Int](repeating: 0, count: playerN.count)
        }
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 18
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let picker = UILabel()
        picker.text = pickerData[component][row]
        picker.font = UIFont.boldSystemFont(ofSize: 30)
        picker.textColor = UIColor.black
        picker.textAlignment = NSTextAlignment.center
        return picker
    }
  
    @IBAction func spinButton(_ sender: Any) {
        if spinCount == 0 && yayOrNay == 1 {
        let x = Int.random(in: 0 ... 8)
        let y = Int.random(in: 0 ... 8)
        let z  = Int.random(in: 0 ... 8)
        spinner.selectRow((x), inComponent: 0, animated: true)
        spinner.selectRow((y), inComponent: 1, animated: true)
        spinner.selectRow((z), inComponent: 2, animated: true)

        UIView.animate(withDuration: 3, delay: 0.5, options: .curveEaseOut, animations: {
            
        }, completion: { finished in
            UIView.animate(withDuration: 3, delay: 0.5, options: .curveEaseOut, animations: {
                
                }, completion: nil)
            
            })
        
        var total = Int(pickerData[0][spinner.selectedRow(inComponent: 0)])! + Int(pickerData[1][spinner.selectedRow(inComponent: 1)])! + Int(pickerData[2][spinner.selectedRow(inComponent: 2)])!
        print(total)
        scoreList[c % playerN.count] += total
            spinCount += 1
        }
    }
    
    
    @IBAction func anotherRound(_ sender: Any) {
        let displayVC : GameViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "game") as! GameViewController
        displayVC.count = c + 1
        displayVC.playerName = playerN
        displayVC.scoreL = scoreList
        self.present(displayVC, animated: true, completion: nil)

    }
    @IBAction func goToScoreBoard(_ sender: Any) {
        let displayVC : ScoreTableViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "score") as! ScoreTableViewController
       displayVC.listOfScore = scoreList
        displayVC.playerNam = playerN
        displayVC.cunty = c + 1
        self.present(displayVC, animated: true, completion: nil)

    }
    @IBAction func endGame(_ sender: Any) {
        let displayVC : WinnerViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "winner") as! WinnerViewController
        displayVC.players = playerN
        displayVC.scores = scoreList
        self.present(displayVC, animated: true, completion: nil)
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
