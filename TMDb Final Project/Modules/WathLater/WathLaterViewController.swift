
import UIKit
import Alamofire
import RealmSwift

class WathLaterViewController: UIViewController {
    @IBOutlet weak private var wathLaterTableView: UITableView!
    
    var savedMediaList:[WathLaterRealm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setapInterfase()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getSavedMedia()
    }
    
    
    
    private func getSavedMedia(){
        savedMediaList = DataManager.shared.getWathLaterList()
        wathLaterTableView.reloadData()
    }
    private func setapInterfase(){
        let cellNib = UINib(nibName: "MediaViewCell", bundle: nil)
        wathLaterTableView.register(cellNib, forCellReuseIdentifier: "MediaViewCell")
    }
}
//MARK: - WathLater DataSource, Delegate

extension WathLaterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ wathLaterTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedMediaList.count
    }
    
    func tableView(_ wathLaterTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = wathLaterTableView.dequeueReusableCell(withIdentifier: String(describing: MediaViewCell.self)) as? MediaViewCell{
            cell.configure(with: savedMediaList[indexPath.row])
            cell.configureInterfaceSetting()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detalisViewController = storyboard.instantiateViewController(withIdentifier: "DetalisViewController") as? DetalisViewController{
            detalisViewController.savedMediaDetalis = savedMediaList[indexPath.row]
            navigationController?.pushViewController(detalisViewController, animated: true)
        }
        
    }
}
