//
//  FirstViewController.swift
//  HidesNavigationBarDuringPresentationTest
//
//  Created by Frank Lehmann on 27.09.19.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Test"
        
        tableView.delegate = self
        tableView.dataSource = self
                
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController

        // This leads to the bug
        searchController.hidesNavigationBarDuringPresentation = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(leftTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(rightTapped))
    }

    @objc func rightTapped() {
        performSegue(withIdentifier: "success", sender: self)
    }

    @objc func leftTapped() {
        performSegue(withIdentifier: "success", sender: self)
    }

    
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // Random text
        cell.textLabel?.text = "\(Int.random(in: 0...10000))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "success", sender: self)
    }
}


