//
//  TableViewCellWithSwitcher.swift
//  HW13-Settings
//
//  Created by Onix qq on 26.06.22.
//

import UIKit

class TableViewCellWithSwitcher: UITableViewCell {
    static let identifier = "TableViewCellWithSwitcher"
    
    private lazy var container: UIImageView = {
        let container = UIImageView()
        container.layer.cornerRadius = Metric.cellIconViewCornerRadius
        container.clipsToBounds = true
        return container
    }()
    
    private lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .white
        iconView.layer.cornerRadius = Metric.cellIconViewCornerRadius
        iconView.clipsToBounds = true
        iconView.layer.masksToBounds = true
        return iconView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Switch"
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
        
        accessoryView = switcher
        contentView.addSubview(container)
        container.addSubview(iconView)
        contentView.addSubview(label)
        contentView.addSubview(switcher)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Settings
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            container.heightAnchor.constraint(equalToConstant: Metric.containerViewSize),
            container.widthAnchor.constraint(equalToConstant: Metric.containerViewSize)
        ])
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            iconView.heightAnchor.constraint(equalToConstant: Metric.iconeViewSize),
            iconView.widthAnchor.constraint(equalToConstant: Metric.iconeViewSize)
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant: Metric.labelLeftOffset)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        accessoryType = .disclosureIndicator
    }
    
    // MARK: - Actions
    
    @objc func switchAction() {
        if switcher.isOn {
            print("Turn On")
        } else {
            print("Turn Off")
        }
    }
    
    // MARK: - Configure cell
    
    func configure(with model: Cell) {
        if model.isCustomCell  {
            iconView.image = UIImage(named: model.imageName)
        } else {
            iconView.image = UIImage(systemName: model.imageName)
        }
        
        container.backgroundColor = model.containerBackgroundColor
        label.text = model.title
    }
}
