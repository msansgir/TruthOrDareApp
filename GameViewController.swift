//
//  GameViewController.swift
//  AzureMLApp
//
//  Created by Mallika Sansgiri on 3/23/20.
//  Copyright © 2020 Mallika Sansgiri. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var playerName : [String] = []
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var dare: UITextView!
    var scoreL : [Int] = []
    var tru = "truth"
    var count = 0
    var questionCount = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        playerLabel.text = playerName[count % playerName.count]
        // Do any additional setup after loading the view.
        print(scoreL)
    }
    
    
    func read(fileName: String) -> String {
        var contents = ""
        var thing : [String] = []
        if let filepath = Bundle.main.path(forResource: fileName, ofType: "txt") {
            do {
                contents = try String(contentsOfFile: filepath)
               
                thing = contents.components(separatedBy: "\n")
               // unfilteredNFLTeams = contents.components(separatedBy: "\n")
                // unfilteredNFLTeams = unfilteredNFLTeams?.sorted()
                // unfilteredNFLTeams?.remove(at: 0)
                //unfilteredNFLTeams!.sorted()
                
                
                //print(contents)
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        
        let num = Int.random(in: 0 ... (thing.count - 1))
    
        return thing[num]
    }
    
    @IBAction func TruthButton(_ sender: Any) {
        if questionCount == 0 {
        dare.text = read(fileName: "Truth")
            questionCount += 1
        }
        
    }
    @IBAction func DareButton(_ sender: Any) {
        if questionCount == 0 {
            tru = "dare"
          dare.text = read(fileName: "Dare")
            questionCount += 1
            
        }
        
    }
    @IBAction func No(_ sender: Any) {
        if questionCount > 0 {
        let displayVC : PointsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "point") as! PointsViewController
        displayVC.playerN = playerName
        displayVC.yayOrNay = 0
            displayVC.c = count
              displayVC.truthOrDare = tru
            displayVC.scoreList = scoreL
        
        self.present(displayVC, animated: true, completion: nil)
        }
    }
    @IBAction func Yes(_ sender: Any) {
        if questionCount > 0 {
        let displayVC : PointsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "point") as! PointsViewController
        displayVC.playerN = playerName
        displayVC.yayOrNay = 1
            displayVC.c = count
            displayVC.truthOrDare = tru
             displayVC.scoreList = scoreL
        
        self.present(displayVC, animated: true, completion: nil)
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
