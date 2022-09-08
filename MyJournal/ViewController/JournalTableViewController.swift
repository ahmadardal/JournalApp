//
//  JournalTableViewController.swift
//  MyJournal
//
//  Created by Ahmad Ardal on 2022-09-06.
//

import UIKit

class JournalTableViewController: UITableViewController {
    
    var JournalCell = "JournalCell"
    
    var journal = Journal()
    
    let segueToCreateEntry = "segueToCreateEntry"
    
    let segueToViewEntry = "segueToViewEntry"
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        journal.addEntry(entry: JournalEntry(title: "Min första entry", content: "Idag hade jag min första lektion"))
        
        journal.addEntry(entry: JournalEntry(title: "Min andra entry", content: "Jag mår jättebra idag"))
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    
    // Antalet sektioner som våran TableView har.
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // Bestämmer antalet rader i varje sektion. Om man har stöd för flera sektioner, så kan man skilja dem åt genom deras section nummer.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return journal.count
    }
    
    // Returnerar varje enskild cell. Vi kan formatera varje cell dynamiskt här. Vi kan även veta vilken rad som våran cell befinner sig i, genom indexPath. Den här funktionen kommer att köras en gång för varje cell.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JournalCell, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        if let entry = journal.getEntryAt(index: indexPath.row) {
            content.text = "\(entry.date) \(entry.title)"
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let remove = UIContextualAction(style: .destructive, title: "Delete", handler: {(action, view, completion) in
            self.journal.removeAt(index: indexPath.row) // Tar bort entryt från våran array
            self.myTableView.deleteRows(at: [indexPath], with: .fade) // Tar bort raden från våran TableView
        })
        
        let test = UIContextualAction(style: .normal, title: "Test", handler: {(action, view, completion) in
            self.performSegue(withIdentifier: self.segueToViewEntry, sender: self)
        })
        
        test.backgroundColor = UIColor.init(red: 114/255, green: 0/255, blue: 201/255, alpha: 1)
        
        
        let actions = UISwipeActionsConfiguration(actions: [remove, test])
        
        return actions
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case segueToCreateEntry:
            if let destinationVC = segue.destination as? CreateEntryViewController {
                destinationVC.journal = self.journal
            }
            break
        case segueToViewEntry:
            
//            if let destinationVC = segue.destination as? ExistingEntryViewController,
//               let selectedCellIndex = myTableView.indexPathForSelectedRow?.row {
//               let selectedEntry = journal.getEntryAt(index: selectedCellIndex)
//                destinationVC.journalEntry = selectedEntry
//            }
            
//            if let destinationVC = segue.destination as? ExistingEntryViewController,
//               let cell = sender as? UITableViewCell,
//               let indexPath = myTableView.indexPath(for: cell),
//               let entry = journal.getEntryAt(index: indexPath.row) {
//
//                destinationVC.journalEntry = entry
//
//            }
            // Guard statements
        
            
            
            
            guard let destinationVC = segue.destination as? ExistingEntryViewController else { return }
            guard let cell = sender as? UITableViewCell else { return }
            guard let indexPath = myTableView.indexPath(for: cell) else { return }
            guard let entry = journal.getEntryAt(index: indexPath.row) else { return }
            
            //
            
            destinationVC.journalEntry = entry
            
            
            break
        default: return
        }
        
    }
    
    
}
