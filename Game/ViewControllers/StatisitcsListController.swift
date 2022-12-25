import UIKit

class StatisitcsListController: UITableViewController {
    
    private let logics = Game.shared

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        logics.statics.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let logic = logics.statics[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = logic.rawValue
        config.textProperties.font = UIFont.systemFont(ofSize: 22)
        cell.contentConfiguration = config
        return cell
    }
    
    
    @IBAction func clearButton(_ sender: UIBarButtonItem) {
        logics.statics.removeAll()
        tableView.reloadData()
    }
}
