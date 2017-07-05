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
    
    override func viewWillAppear(_ animated: Bool) {
        self.arrayUserTickets = RDPTicketBC.listarTicketsPorUsuario(RDPUsuarioBC.sharedInstance.objSesionUsuario!.usuario_name!)
        self.arrayUserTicketsFiltered = self.arrayUserTickets
        self.tlbTicket.reloadData()
        
        super.viewWillAppear(animated)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "RDPDetalleViewController", sender: self.arrayUserTicketsFiltered[indexPath.row])
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
    
    // MARK: - LogOut
    
    
    @IBAction func clickBtnLogOut(_ sender: Any) {
        RDPUsuarioBC.eliminarSesionUsuario()
        self.navigationController?.dismiss(animated: true, completion: nil)
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RDPDetalleViewController"{
            let controller = segue.destination as! RDPDetalleViewController
            controller.objTicket = sender as! Ticket
        }
    }
    

}
