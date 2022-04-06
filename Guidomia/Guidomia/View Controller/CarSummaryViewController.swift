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
    
    let contentView = UIView()
    let filterView = UIView()
    let imageView = UIImageView()
    let filterStackView = UIStackView()
    
    let filterLabel = UILabel()
    let makeTF: UITextField = UITextField(frame: CGRect(x: 0, y: 320, width: 200, height: 30.00))
    let modelTF = UITextField(frame: CGRect(x: 0, y: 320, width: 300.00, height: 30.00))
    
    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        setupTableHeaderView()
        setupNavigationBar()
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

// MARK: - Custom methods to setup tableview and navigationBar

extension CarSummaryViewController {
    private func setup(){
        setupTableView()
        setupFilterView()
        filterViewLayout()
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
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 375),
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
            firstLabel.textColor = .white
            firstLabel.text = "GUIDOMIA"
            
            navigationBar.addSubview(firstLabel)
        }
    }
    
//    private func setupTableHeaderView() {
//        let header = CarHeaderView(frame: .zero)
//        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//        size.width = UIScreen.main.bounds.width
//        header.frame.size = size
//
//        tableView.tableHeaderView = header
//    }
}



// MARK: - Method to setup filters

extension CarSummaryViewController {
    
    private func setupFilterView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "Tacoma")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.backgroundColor = UIColor(named: "carLightGreyColor")
        filterView.layer.cornerRadius = 10
        
        filterStackView.translatesAutoresizingMaskIntoConstraints = false
        filterStackView.axis = .vertical
        filterStackView.spacing = 2
      
        
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        filterLabel.textColor = UIColor(named: "carDarkGreyColor")
        filterLabel.text = "Filter :"
        
        makeTF.translatesAutoresizingMaskIntoConstraints = false
        makeTF.placeholder = "Make"
        makeTF.borderStyle = UITextField.BorderStyle.roundedRect
        makeTF.backgroundColor = .white
        makeTF.textColor = UIColor(named: "carDarkGreyColor")
        
        modelTF.translatesAutoresizingMaskIntoConstraints = false
        modelTF.placeholder = "Model"
        modelTF.borderStyle = UITextField.BorderStyle.roundedRect
        modelTF.backgroundColor = .white
        modelTF.textColor = UIColor(named: "carDarkGreyColor")
        
        filterStackView.addArrangedSubview(filterLabel)
        filterStackView.addArrangedSubview(makeTF)
        filterStackView.addArrangedSubview(modelTF)
        
        filterView.addSubview(filterStackView)
        
        contentView.addSubview(imageView)
        contentView.addSubview(filterView)
        
        view.addSubview(contentView)
        
    }
    
    private func filterViewLayout() {
        
       // contentView
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 380)
        ])
        
        // ImageView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 170)
        ])
        
        //filterView
        NSLayoutConstraint.activate([
            filterView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            filterView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            filterView.heightAnchor.constraint(equalToConstant: 122),
            filterView.widthAnchor.constraint(equalToConstant: 348)
        ])
        
        //filterStackview
        NSLayoutConstraint.activate([
            
            filterStackView.topAnchor.constraint(equalTo: filterView.topAnchor, constant: 10),
            filterStackView.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 20)
            
        ])
        
    }
    
}


