//
//  ViewController.swift
//  Guidomia
//
//  Created by Archit Patel on 2022-04-04.
//

import UIKit
import DropDown

class CarSummaryViewController: UIViewController {
    
    
    var tableView = UITableView()
    var viewModel = CarViewModel()
    var pickerView = UIPickerView()
    
    let contentView = UIView()
    let filterView = UIView()
    let imageView = UIImageView()
    
    
    let filterLabel = UILabel()
    let makeTF = UIView()
    let makeLabel = UILabel()
    let makeButton = UIButton()
    let modelTF = UIView()
    let modelLabel = UILabel()
    let modelButton = UIButton()
    
    let makeDD = DropDown()
    let modelDD = DropDown()

    var carsMake = ["Land Rover", "Alpine", "BMW", "Mercedes Benz"]
    var carsModel = ["Range Rover", "Roadster", "3300i", "GLE coupe"]

    
    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        setupTableHeaderView()
        setupNavigationBar()
        setupDropDown()
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
        
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        filterLabel.textColor = UIColor(named: "carDarkGreyColor")
        filterLabel.text = "Filter :"
        
        makeTF.translatesAutoresizingMaskIntoConstraints = false
        makeTF.backgroundColor = .white
        makeTF.layer.cornerRadius = 10
        makeTF.layer.borderColor = UIColor.black.cgColor
        makeTF.layer.borderWidth = 1
        
        makeLabel.translatesAutoresizingMaskIntoConstraints = false
        makeLabel.textColor = UIColor(named: "carDarkGreyColor")
        makeLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        makeLabel.text = "Make"
        
        makeButton.translatesAutoresizingMaskIntoConstraints = false
        makeButton.setTitle(" ", for: .normal)
        makeButton.layer.cornerRadius = 10
        makeButton.addTarget(self, action: #selector(makeButtonPressed), for: .touchUpInside)
        
        modelTF.translatesAutoresizingMaskIntoConstraints = false
        modelTF.backgroundColor = .white
        modelTF.layer.cornerRadius = 10
        modelTF.layer.borderColor = UIColor.black.cgColor
        modelTF.layer.borderWidth = 1
        
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        modelLabel.textColor = UIColor(named: "carDarkGreyColor")
        modelLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        modelLabel.text = "Model"
        
        modelButton.translatesAutoresizingMaskIntoConstraints = false
        modelButton.setTitle(" ", for: .normal)
        modelButton.layer.cornerRadius = 10
        modelButton.addTarget(self, action: #selector(modelButtonPressed), for: .touchUpInside)
        
        makeTF.addSubview(makeLabel)
        makeTF.addSubview(makeButton)
        modelTF.addSubview(modelLabel)
        modelTF.addSubview(modelButton)
        
        filterView.addSubview(filterLabel)
        filterView.addSubview(makeTF)
        filterView.addSubview(modelTF)
        
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
        
        //filterLabel
        NSLayoutConstraint.activate([
            filterLabel.topAnchor.constraint(equalTo: filterView.topAnchor, constant: 10),
            filterLabel.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 20)
        ])
     
        //makeTF
        NSLayoutConstraint.activate([
            makeTF.topAnchor.constraint(equalToSystemSpacingBelow: filterLabel.bottomAnchor, multiplier: 1),
            makeTF.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 20),
            makeTF.widthAnchor.constraint(equalToConstant: 300),
            makeTF.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //makeLabel
        NSLayoutConstraint.activate([
            makeLabel.topAnchor.constraint(equalTo: makeTF.topAnchor, constant: 2),
            makeLabel.leadingAnchor.constraint(equalTo: makeTF.leadingAnchor, constant: 3)
        ])
        
        //makeButton
        NSLayoutConstraint.activate([
            makeButton.topAnchor.constraint(equalTo: makeTF.topAnchor),
            makeButton.leadingAnchor.constraint(equalTo: makeTF.leadingAnchor),
            makeButton.widthAnchor.constraint(equalToConstant: 300),
            makeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //modelTF
        NSLayoutConstraint.activate([
            modelTF.topAnchor.constraint(equalToSystemSpacingBelow: makeTF.bottomAnchor, multiplier: 1),
            modelTF.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 20),
            modelTF.widthAnchor.constraint(equalToConstant: 300),
            modelTF.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //modelLabel
        NSLayoutConstraint.activate([
            modelLabel.topAnchor.constraint(equalTo: modelTF.topAnchor, constant: 2),
            modelLabel.leadingAnchor.constraint(equalTo: modelTF.leadingAnchor, constant: 3)
        ])
               
        //modelButton
        NSLayoutConstraint.activate([
            modelButton.topAnchor.constraint(equalTo: modelTF.topAnchor),
            modelButton.leadingAnchor.constraint(equalTo: modelTF.leadingAnchor),
            modelButton.widthAnchor.constraint(equalToConstant: 300),
            modelButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

// MARK: - Actions
extension CarSummaryViewController {
    
    @objc func makeButtonPressed() {
        makeDD.show()
    }
    
    @objc func modelButtonPressed() {
        modelDD.show()
    }
}


// MARK: - Dropdown setup

extension CarSummaryViewController {
    
    private func setupDropDown() {
        
        // Make dropDown
        makeDD.anchorView = makeTF
        makeDD.dataSource = carsMake

        // Action triggered on selection
        makeDD.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.makeLabel.text = carsMake[index]
        }
        makeDD.bottomOffset = CGPoint(x: 0, y:(makeDD.anchorView?.plainView.bounds.height)!)
        makeDD.topOffset = CGPoint(x: 0, y:-(makeDD.anchorView?.plainView.bounds.height)!)
        makeDD.direction = .bottom
        
        
        //Model Dropdown
        modelDD.anchorView = modelTF
        modelDD.dataSource = carsModel

        // Action triggered on selection
        modelDD.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.modelLabel.text = carsModel[index]
        }
        modelDD.bottomOffset = CGPoint(x: 0, y:(makeDD.anchorView?.plainView.bounds.height)!)
        modelDD.topOffset = CGPoint(x: 0, y:-(makeDD.anchorView?.plainView.bounds.height)!)
        modelDD.direction = .bottom
    }
    
}
