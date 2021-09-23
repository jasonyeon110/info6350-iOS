//
//  ViewController.swift
//  CustomTableView
//
//  Created by Jason Yeon on 9/20/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let fruits = ["banana", "Blue_Berry", "cherry", "frozen Berries", "green_Apple", "Kiwi", "lemmon", "papaya", "Pineapple", "strawberry", "waterMelon"]
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.imgView.image = UIImage(named: fruits[indexPath.row])
        cell.lblImage.text = fruits[indexPath.row]
        
        return cell
        
    }

}

