//
//  ViewController.swift
//  SegueExample
//
//  Created by Jason Yeon on 9/23/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtLabelName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func gotoSecondScreen(_ sender: Any) {
        performSegue(withIdentifier: "segueGoToSecond", sender: self)
    }
    
    //before segue get perform this function will get executed first
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGoToSecond" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.strLable = txtLabelName.text
        }
    }
    
}

