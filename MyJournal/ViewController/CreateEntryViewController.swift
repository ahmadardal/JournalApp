//
//  CreateEntryViewController.swift
//  MyJournal
//
//  Created by Ahmad Ardal on 2022-09-06.
//

import UIKit

class CreateEntryViewController: UIViewController {
    
    var journal: Journal?

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtContent: UITextView!
    @IBOutlet weak var switchDate: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        txtContent.layer.borderColor = UIColor.init(red: 225/255, green: 225/255, blue: 225/255, alpha: 1).cgColor
        txtContent.layer.borderWidth = 0.8
        txtContent.layer.cornerRadius = 7.0
        
        datePicker.isHidden = !switchDate.isOn
        
        datePicker.date = Date()

    }
    
    @IBAction func onSwitchDate(_ sender: UISwitch) {
        datePicker.isHidden = !sender.isOn
    }
    
    @IBAction func onSave(_ sender: Any) {
        
        if let title = txtTitle.text,
           let content = txtContent.text,
           let journal = journal {
            
            if title != "" && content != "" {
                if switchDate.isOn {
                    journal.addEntry(entry: JournalEntry(title: title, content: content, date: datePicker.date))
                } else {
                    journal.addEntry(entry: JournalEntry(title: title, content: content))
                }
            }
            

        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
