//
//  ViewController.swift
//  ShoppingList
//
//  Created by Kevin Rama on 2/19/19.
//  Copyright © 2019 Kevin Rama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = [String]();

    @IBOutlet var desc: UITextField!
    @IBOutlet var quantity: UITextField!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet var tableView: UITableView!
    

    
    @IBAction func addItem(_ sender: Any) {
        if (desc.text != "" && quantity.text != ""){
            list.append("\(quantity.text!) ,  \(desc.text!)x ");
            self.tableView.reloadData();
        }
    }
    
    
    @IBAction func newItem(_ sender: UIButton) {
        self.quantity.text = "";
        self.desc.text = "";
    }
    
    
    
    @IBAction func newList(_ sender: Any) {
        if(list.isEmpty != true){
            list.removeAll();
            list = [];
            self.tableView.reloadData();
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCells", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row];
        return cell;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete){
            list.remove(at: indexPath.item);
            self.tableView.reloadData();
        }
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for tf in textFields {
            tf.resignFirstResponder();
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource! = self;
        tableView.delegate! = self;
        quantity.keyboardType = UIKeyboardType.alphabet;
        desc.keyboardType = UIKeyboardType.numberPad;
        // Do any additional setup after loading the view, typically from a nib.
    }


}

