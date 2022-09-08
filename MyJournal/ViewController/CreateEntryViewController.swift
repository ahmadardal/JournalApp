//
//  CreateEntryViewController.swift
//  MyJournal
//
//  Created by Ahmad Ardal on 2022-09-06.
//

import UIKit

class CreateEntryViewController: UIViewController {

    
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var switchDate: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var txtContent: UITextView!
    
    var journal: Journal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        txtContent.layer.borderWidth = 1
        txtContent.layer.borderColor = UIColor.init(red: 160/255, green: 160/255, blue: 160/255, alpha: 0.25).cgColor
        
        
        txtContent.layer.cornerRadius = 7.0
        
        datePicker.isHidden = !switchDate.isOn
        
    }
    
    
    @IBAction func onSave(_ sender: Any) {
        
        if let title = txtTitle.text,
           let journal = journal,
           let content = txtContent.text {
            
            if title != "" && content != "" {
                
                if switchDate.isOn {
                    journal.addEntry(entry: JournalEntry(title: title, content: content, date: datePicker.date))
                } else {
                    journal.addEntry(entry: JournalEntry(title: title, content: content))
                }
                
                self.navigationController?.popViewController(animated: true)
            }
            
            
        }
        


    }
    
    
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        datePicker.isHidden = !sender.isOn
    }
    

}
