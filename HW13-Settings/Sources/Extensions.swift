import UIKit

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = model[indexPath.section][indexPath.row]
        
        switch indexPath.section {
            case 0:
                switch indexPath.row {
                    case 0, 4:
                        guard let cell = tableView.dequeueReusableCell(
                            withIdentifier: TableViewCellWithSwitcher.identifier,
                            for: indexPath
                        ) as? TableViewCellWithSwitcher else {
                            return UITableViewCell()
                        }
                        cell.configure(with: cellData)
                        return cell
                    case 1, 2:
                        guard let cell = tableView.dequeueReusableCell(
                            withIdentifier: TableViewCellWithDetailLabel.identifier,
                            for: indexPath
                        ) as? TableViewCellWithDetailLabel else {
                            return UITableViewCell()
                        }
                        cell.configure(with: cellData)
                        return cell
                    default:
                        guard let cell = tableView.dequeueReusableCell(
                            withIdentifier: TableViewCellCustom.identifier,
                            for: indexPath
                        ) as? TableViewCellCustom else {
                            return UITableViewCell()
                        }
                        cell.configure(with: cellData)
                        return cell
                }
            case 1:
                switch indexPath.row {
                    default:
                        guard let cell = tableView.dequeueReusableCell(
                            withIdentifier: TableViewCellCustom.identifier,
                            for: indexPath
                        ) as? TableViewCellCustom else {
                            return UITableViewCell()
                        }
                        cell.configure(with: cellData)
                        return cell
                }
            default:
                switch indexPath.row {
                    case 0:
                        guard let cell = tableView.dequeueReusableCell(
                            withIdentifier: TableViewCellWithButton.identifier,
                            for: indexPath
                        ) as? TableViewCellWithButton else {
                            return UITableViewCell()
                        }
                        cell.configure(with: cellData)
                        return cell
                    default:
                        guard let cell = tableView.dequeueReusableCell(
                            withIdentifier: TableViewCellCustom.identifier,
                            for: indexPath
                        ) as? TableViewCellCustom else {
                            return UITableViewCell()
                        }
                        cell.configure(with: cellData)
                        return cell
                }
        }
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Нажата ячейка \(model[indexPath.section][indexPath.row].title)")
    }
}
