//
//  SpaceMasterViewController.swift
//  SpaceX
//
//  Created by Rodrigo Lara on 09/08/22.
//

import UIKit
import AlamofireImage

class SpaceMasterViewController: UIViewController {
    
    @IBOutlet weak var launcheTableView: UITableView!

    var launches: [Launches] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.launcheTableView.register(UINib(nibName: "LaunchTableViewCell", bundle: nil), forCellReuseIdentifier: "LuncheIdentifier")

        loadData()
    }

    func loadData() {
        APIRest.launches { response in
            if response.response?.statusCode == 200 {
                if let value = response.value as? NSArray {
                    self.launches = Launches.allData(value)
                    
                    self.launcheTableView.reloadData()
                }
            }
        }
    }
    
    func formatDate(date: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let dateObj: Date? = dateFormatterGet.date(from: date)
        
        return dateFormatter.string(from: dateObj!)
    }
}

extension SpaceMasterViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LuncheIdentifier", for: indexPath) as! LaunchTableViewCell
        
        let launche = launches[indexPath.row]
        
        if let url = URL(string: launche.small) {
            cell.launcheImage.af.setImage(withURL: url)
        }
        
        cell.missionName.text = launche.name
        cell.missionDesc.text = launche.details
        cell.missionDate.text = self.formatDate(date: launche.date_utc)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let launche = launches[indexPath.row]
        
        let spaceDetail = SpaceDetailViewController(nibName: "SpaceDetailViewController", bundle: nil)
        spaceDetail.launche = launche
        
        self.navigationController?.pushViewController(spaceDetail, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
