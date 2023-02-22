//
//  TrackTableViewCell.swift
//  DemoProject
//
//  Created by Rhytthm on 22/02/23.
//

import UIKit

class TrackTableViewCell: UITableViewCell {

    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var TrackImage: UIImageView!
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(with data: Result){
        self.trackName.text = data.trackName
        self.artistName.text = data.artistName
        self.price.text = "\(data.trackRentalPrice)"
        self.DescriptionLabel.text = data.shortDescription
        self.TrackImage.loadFrom(URLAddress: data.image)
    }

}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
