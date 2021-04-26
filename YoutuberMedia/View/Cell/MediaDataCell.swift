//
//  MediaDataCell.swift
//  YoutuberMedia
//
//  Created by Kay Chang on 2021/4/17.
//

import UIKit

class MediaDataCell: UITableViewCell {
    
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mediaImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(mediaData: MediaData) {
        titleLabel.text = mediaData.title
        subTitleLabel.text = mediaData.subTitle
        
        if let imageUrlString = mediaData.imageUrl, let url = URL(string: imageUrlString) {
            
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        self?.mediaImageView.image = UIImage(data: data)
                    }
                }
                if let error = error {
                    print(error)
                }
            }.resume()
        }
    }
}
