//
//  RDPDesarrolladorViewController.swift
//  Registro_De_Problemas
//
//  Created by B303-04 on 22/06/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit
import CoreData

class RDPDesarrolladorViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tblTickets: UITableView!
    
    var arrayTickets = [Ticket]()
    var arrayTicketsFiltered = [Ticket]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTicketsFiltered.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "RDPTicketTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RDPTicketTableViewCell
        
        cell.objTicket = arrayTicketsFiltered[indexPath.row]
        
        cell.actualizarData()
        return cell
    }

    
    
    // Mark: - SearchBar
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
