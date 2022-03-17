//
//  ViewController.swift
//  VMTask
//
//  Created by Nishanth on 12/03/22.
//

import UIKit

class ViewController: UIViewController {
    
@IBOutlet weak var tableView:UITableView!
    
    var filteredArray:[Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPersonList()
    }

    func getPersonList() {
        let url = Network.shared.getBaseUrl() + Network.shared.getPersonUrl()
        
        Network.shared.fetch(decodeType: Person.self, urlString: url) { (response) in
            self.filteredArray = response
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
            PersonTableViewCell
        cell.setValues(person: filteredArray![indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
    
}



