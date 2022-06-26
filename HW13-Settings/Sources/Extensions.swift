import UIKit

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0, 4:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TableViewCellWithSwitcher.identifier,
                    for: indexPath
                ) as? TableViewCellWithSwitcher else {
                    return UITableViewCell()
                }
                cell.textLabel?.text = "\(indexPath.row)"
                return cell
            default:
                return UITableViewCell()
        }
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Нажата ячейка \(indexPath.row)")
    }
}
