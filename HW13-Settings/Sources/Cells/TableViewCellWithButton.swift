//
//  TableViewCellWithSwitcher.swift
//  HW13-Settings
//
//  Created by Onix qq on 26.06.22.
//

import UIKit

class TableViewCellWithButton: UITableViewCell {
    static let identifier = "TableViewCellWithButton"
    
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
        config.buttonSize = .small
        
        let button = UIButton()
        button.configuration = config
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .disclosureIndicator
        contentView.addSubview(container)
        container.addSubview(iconView)
        contentView.addSubview(label)
        contentView.addSubview(button)
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
    
    // MARK: - Configure cell
    
    func configure(with model: Cell) {
        if model.isCustomCell  {
            iconView.image = UIImage(named: model.imageName)
        } else {
            iconView.image = UIImage(systemName: model.imageName)
        }
        
        container.backgroundColor = model.containerBackgroundColor
        label.text = model.title
        button.setTitle(model.buttonTitle, for: .normal)
    }
}

