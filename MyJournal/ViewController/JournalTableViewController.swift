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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        journal.addEntry(entry: JournalEntry(title: "Min första entry", content: "Idag hade jag min första lektion"))
        
        journal.addEntry(entry: JournalEntry(title: "Min andra entry", content: "Jag mår jättebra idag"))
        
        
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
            content.text = "\(entry.date) \(entry.content)"
        }
        
        cell.contentConfiguration = content

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
