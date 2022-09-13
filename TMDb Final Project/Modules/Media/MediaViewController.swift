
import UIKit

class MediaViewController: UIViewController {
    
    @IBOutlet weak private var mediaSearchBar: UISearchBar!
    @IBOutlet weak private var mediaSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mediaTableView: UITableView!
    
    
    var searchMediaUrl=""
    var mainMediaDataList: [Results] = []
    var searchDelayer: Timer!
    var searchTextRename = ""
    
    
    var trendingMoviesUrl = Const.Request.urlForMovie
    var loadMediaDataUrl = Const.Request.urlForMovie
    
    
    let viewModel = MediaViewControllerViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        
        
        
        viewModel.loadGenreList(ganreList: Const.ganreList.movie.rawValue)
        viewModel.loadGenreList(ganreList: Const.ganreList.tv.rawValue)
        loadTrendingMovies(url: loadMediaDataUrl)
        setapInterfase()
        
    }
    
    //MARK:- Actions
    
    @IBAction func mediaSegmentControlAction(_ sender: UISegmentedControl) {
        switch mediaSegmentedControl.selectedSegmentIndex {
        case 0:
            Global.mediaType = .movie
            
        case 1:
            Global.mediaType = .tv
        default:
            break
        }
        
        if mediaSearchBar.text != "" {
            self.searchMedia(url: Const.bildSearchUrl(mediaType: Global.mediaType.rawValue, searchText: mediaSearchBar.text ?? ""))
            //тут лінка, змінити на медіа
        }else{
            self.loadTrendingMovies(url: Const.bildUrl.trendingMediaWeekUrl(requestType: Const.requestType.trending.rawValue, mediaType: Global.mediaType.rawValue, hesPeriod: true))
        }
        
    }
    
    //MARK:- Private func
    private func setapInterfase(){
        let stringCellIdentifire = String(describing: mediaViewCell.self)
        let cellNib = UINib(nibName: stringCellIdentifire, bundle: nil)
        mediaTableView.register(cellNib, forCellReuseIdentifier: stringCellIdentifire)
    }
}




//MARK: - UITableView
extension MediaViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ mediaTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainMediaDataList.count
    }
    
    func tableView(_ mediaTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = mediaTableView.dequeueReusableCell(withIdentifier:String(describing: mediaViewCell.self)) as? mediaViewCell{
            cell.configure(with: mainMediaDataList[indexPath.row])
            cell.configureInterfaceSetting()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ mediaTableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detalisViewController = storyboard.instantiateViewController(withIdentifier:String(describing: DetalisViewController.self)) as? DetalisViewController{
            detalisViewController.mediaDetalis = mainMediaDataList[indexPath.row]
            navigationController?.pushViewController(detalisViewController, animated: true)
        }
    }
}

//MARK: - SearchBarDelegate

extension MediaViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.count != 0 else {self.loadTrendingMovies(url: Const.bildUrl.trendingMediaWeekUrl(requestType: Const.requestType.trending.rawValue, mediaType: Global.mediaType.rawValue, hesPeriod: true));
            return }
        searchTextRename = searchText
        searchDelayer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { searchDelayer in
            guard self.searchTextRename != searchText else
            {
                self.searchMedia(url: Const.bildSearchUrl(mediaType: Global.mediaType.rawValue, searchText: searchText))
                return
            }
        })
    }
}




