//
//  ExistingEntryViewController.swift
//  MyJournal
//
//  Created by Ahmad Ardal on 2022-09-06.
//

import UIKit

class ExistingEntryViewController: UIViewController {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var txtContent: UITextView!
    
    var journalEntry: JournalEntry?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let journalEntry = journalEntry {
            
            lblTitle.text = journalEntry.title
            lblDate.text = journalEntry.date
            txtContent.text = journalEntry.content
            
        }
    }
    
    
    

}
