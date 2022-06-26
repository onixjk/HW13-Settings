//
//  TableViewCellWithSwitcher.swift
//  HW13-Settings
//
//  Created by Onix qq on 26.06.22.
//

import UIKit

class TableViewCellWithButton: UITableViewCell {
    static let identifier = "TableViewCellWithButton"
    
    private lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .white
        iconView.layer.cornerRadius = Metric.cellIconViewCornerRadius
        iconView.clipsToBounds = true
        
        return iconView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()
    
    private lazy var button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemRed
        config.buttonSize = .mini
        config.title = "1"
        
        let button = UIButton()
        button.configuration = config
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.accessoryType = .disclosureIndicator
        self.contentView.addSubview(iconView)
        self.contentView.addSubview(label)
        self.contentView.addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Settings
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            iconView.heightAnchor.constraint(equalToConstant: Metric.iconeViewSize),
            iconView.widthAnchor.constraint(equalToConstant: Metric.iconeViewSize)
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant: Metric.labelLeftOffset)
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc func buttonAction() {
        print("Доступно обновлений - \(button.titleLabel?.text ?? "").")
    }
}

