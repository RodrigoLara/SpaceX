//
//  SpaceDetailViewController.swift
//  SpaceX
//
//  Created by Rodrigo Lara on 09/08/22.
//

import UIKit
import AlamofireImage

class SpaceDetailViewController: UIViewController {
    
    @IBOutlet var launcheImage: UIImageView!
    @IBOutlet var launcheName: UILabel!
    @IBOutlet var launcheDetail: UILabel!
    @IBOutlet var seeMoreButton: UIButton!
    
    var launche: Launches?

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }
    
    func loadData() {
        guard let launche = launche else {
            return
        }

        APIRest.launchById(id: launche.id) { response in
            if response.response?.statusCode == 200 {
                if let value = response.value as? NSDictionary {
                    let launche = Launches(value)
                    
                    DispatchQueue.main.async {
                        if let url = URL(string: launche.large) {
                            self.launcheImage.af.setImage(withURL: url)
                        }
                        self.launcheName.text = launche.name
                        self.launcheDetail.text = launche.details
                    }
                }
            }
        }
    }
}
