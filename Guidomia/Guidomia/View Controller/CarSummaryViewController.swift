//
//  ViewController.swift
//  Guidomia
//
//  Created by Archit Patel on 2022-04-04.
//

import UIKit

class CarSummaryViewController: UIViewController {
    
     let images = ["alpine_roadster", "BMW_330i", "Mercedez_benz_GLC", "Range_Rover"]
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBar()
    }
}

extension CarSummaryViewController {
    private func setup(){
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CarCell.self, forCellReuseIdentifier: CarCell.reuseID)
        tableView.rowHeight = CarCell.rowHeight
        tableView.tableFooterView = UIView()
        self.tableView.separatorColor = .clear
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
        if let navigationBar = self.navigationController?.navigationBar {
            let firstFrame = CGRect(x: 20, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            
            let firstLabel = UILabel(frame: firstFrame)
            firstLabel.text = "GUIDOMIA"
            
            navigationBar.addSubview(firstLabel)
        }
    }
}

extension CarSummaryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarCell.reuseID, for: indexPath) as! CarCell
            cell.textLabel?.text = images[indexPath.row]
            return cell
        }
    }

extension CarSummaryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}





