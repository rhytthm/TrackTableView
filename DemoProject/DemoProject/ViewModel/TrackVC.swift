//
//  TrackVC.swift
//  DemoProject
//
//  Created by Rhytthm on 22/02/23.
//

import UIKit

class TrackVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    let parser = Parser()
    var model: Welcome? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        setModel()
    }
    
    func setModel(){
        parser.parser(urlString: "https://jsonblob.com/api/1077945427227328512") { Result in
            self.model = Result
            print("Count ----------->\(self.model?.results.count)")
            DispatchQueue.main.async {
                self.TableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.resultCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TrackTableViewCell
        if let model = model {
            cell.setupUI(with: model.results[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
