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
    
    // MARK: - Table view data source
    
    
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
        
        
        let remove = UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, completion) in
            self.journal.removeEntry(index: indexPath.row)
            self.myTableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        })
        
        let test = UIContextualAction(style: .normal, title: "Test", handler: {(action, view, completion) in
            print("Hello")
        })
        
        test.backgroundColor = UIColor.yellow
        
        
        let actions = UISwipeActionsConfiguration(actions: [remove, test])
        
        return actions
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        switch segue.identifier {
        case segueToCreateEntry:
            let destinationVC = segue.destination as? CreateEntryViewController
            destinationVC?.journal = self.journal
            break
        case segueToViewEntry:
            //            let destinationVC = segue.destination as? ExistingEntryViewController
            //
            //            if let selectedEntry = journal.getEntryAt(index: myTableView.indexPathForSelectedRow?.row ?? 0) {
            //                destinationVC?.journalEntry = selectedEntry
            //            }
            //            break
            
            
//            if let destinationVC = segue.destination as? ExistingEntryViewController {
//                if let cell = sender as? UITableViewCell {
//                    if let indexPath = myTableView.indexPath(for: cell) {
//                        if let entry = journal.getEntryAt(index: indexPath.row) {
//                            destinationVC.journalEntry = entry
//                        }
//                    }
//                }
//            }
            
//            if let destinationVC = segue.destination as? ExistingEntryViewController,
//               let cell = sender as? UITableViewCell,
//               let indexPath = myTableView.indexPath(for: cell),
//               let entry = journal.getEntryAt(index: indexPath.row) {
//                destinationVC.journalEntry = entry
//            }
                    
                
            guard let destinationVC = segue.destination as? ExistingEntryViewController else { return }
            guard let cell = sender as? UITableViewCell else { return }
            guard let indexPath = myTableView.indexPath(for: cell) else { return }
            guard let entry = journal.getEntryAt(index: indexPath.row) else { return }
            
            destinationVC.journalEntry = entry
            
        default: return
            
        }
        
    }
    
    
}
