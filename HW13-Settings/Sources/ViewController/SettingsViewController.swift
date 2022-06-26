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
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupView() {
        self.title = Strings.navigationControllerTitle
        tableView.register(TableViewCellWithSwitcher.self,
                           forCellReuseIdentifier: TableViewCellWithSwitcher.identifier)
        tableView.register(TableViewCellWithDetailLabel.self,
                           forCellReuseIdentifier: TableViewCellWithDetailLabel.identifier)
        tableView.register(TableViewCellWithButton.self,
                           forCellReuseIdentifier: TableViewCellWithButton.identifier)
        tableView.register(TableViewCellCustom.self,
                           forCellReuseIdentifier: TableViewCellCustom.identifier)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

    
