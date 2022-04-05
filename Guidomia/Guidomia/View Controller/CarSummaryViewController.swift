//
//  ViewController.swift
//  Guidomia
//
//  Created by Archit Patel on 2022-04-04.
//

import UIKit

class CarSummaryViewController: UIViewController {
    
   //let images = ["alpine_roadster", "BMW_330i", "Mercedez_benz_GLC", "Range_Rover"]
    
    var tableView = UITableView()
    var viewModel = CarViewModel()
    
    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBar()
    }
}

// MARK: - Custom methods to setup tableview and navigationBar

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
        tableView.backgroundColor = .none
        
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)
        
        
        if let navigationBar = self.navigationController?.navigationBar {
            let firstFrame = CGRect(x: 20, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            let firstLabel = UILabel(frame: firstFrame)
            firstLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
            firstLabel.text = "GUIDOMIA"
            
            navigationBar.addSubview(firstLabel)
        }
    }
}

// MARK: - TableView DataSource Methods

extension CarSummaryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndex == indexPath { return 350}
        return 140
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarCell.reuseID, for: indexPath) as! CarCell
        cell.car = viewModel.data?[indexPath.row]
        cell.selectionStyle = .none
        cell.animate()
        return cell
        }
    }

// MARK: - TableView Delegate Methods

extension CarSummaryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [selectedIndex], with: .none)
        tableView.endUpdates()
        
    }
}





