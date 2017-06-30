//
//  RDPUsuarioViewController.swift
//  Registro_De_Problemas
//
//  Created by B303-04 on 22/06/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit

class RDPUsuarioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    
    @IBOutlet weak var srchFilter: UISearchBar!
    @IBOutlet weak var tlbTicket: UITableView!
    
    var arrayUserTickets = [Ticket]()
    var arrayUserTicketsFiltered = [Ticket]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUserTicketsFiltered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "RDPUserTicketTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RDPUserTicketTableViewCell
        
        cell.objTicket = self.arrayUserTicketsFiltered[indexPath.row]
        cell.actualizarData()
        
        return cell
    }
    
    // MARK: - SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.characters.count == 0{
            self.arrayUserTicketsFiltered = self.arrayUserTickets
        }else{
            let arrayResultado = self.arrayUserTickets.filter{$0.title!.contains(searchText)}
            self.arrayUserTicketsFiltered = arrayResultado
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
