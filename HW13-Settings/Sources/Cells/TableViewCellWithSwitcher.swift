//
//  TableViewCellWithSwitcher.swift
//  HW13-Settings
//
//  Created by Onix qq on 26.06.22.
//

import UIKit

class TableViewCellWithSwitcher: UITableViewCell {
    static let identifier = "TableViewCellWithSwitcher"
    
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
        return label
    }()
    
    private lazy var switcher: UISwitch = {
        let switcher = UISwitch()
        switcher.addTarget(self, action: #selector(switchAction), for: .valueChanged)
        return switcher
    }()
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(iconView)
        self.contentView.addSubview(label)
        self.contentView.addSubview(switcher)
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
        
        switcher.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            switcher.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            switcher.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc func switchAction() {
        if switcher.isOn {
            print("Turn On")
        } else {
            print("Turn Off")
        }
    }
}
