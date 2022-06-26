//
//  ViewController.swift
//  HW13-Settings
//
//  Created by Onix qq on 22.06.22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        
        return tableView
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupView()
        setupTableView()
        setupLayout()
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupView() {
        self.title = Strings.navigationControllerTitle
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupLayout() {
        
    }


}

    
