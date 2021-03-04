//
//  ViewController.swift
//  Note1
//
//  Created by Андрей Василевский on 1/25/21.
//

import UIKit
import RealmSwift

class Instruments: Object {
    @objc dynamic var name: String = ""
   // let describtion = List<Type>()
}



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let realm = try! Realm()
    
    @IBOutlet weak var tableView: UITableView!
    
    var array: Results<Instruments>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadCategories()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = array?[indexPath.row].name ?? "No instruments found"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteCategories(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add Item", message: "Please, write Item that you want", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            if let newItem = textField.text, textField.text != "" {
                //self.array.append(newItem)
                do{
                    try self.realm.write{
                    let instrument = Instruments()
                    instrument.name = newItem
                    self.realm.add(instrument)
                }
                } catch {
                    print(error)
                }
                self.tableView.reloadData()
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Write an insrument"
            textField = alertTextField
        }
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func loadCategories() {
        
        array = realm.objects(Instruments.self)
        tableView.reloadData()
    }
    
    func deleteCategories(indexPath: IndexPath) {
        if let i = array?[indexPath.row] {
            try! realm.write{
                realm.delete(i)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "secondVC", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! SecondViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.recievedString = array?[indexPath.row].name
        }
    }
    
}
