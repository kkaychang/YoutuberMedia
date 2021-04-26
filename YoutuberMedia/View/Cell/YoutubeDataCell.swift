//
//  YoutubeDataCell.swift
//  YoutuberMedia
//
//  Created by Kay Chang on 2021/4/19.
//

import UIKit

class YoutubeDataCell: UITableViewCell {

    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var viewCountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var disLikeCountLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var disLikeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(item: YoutubeMediaDetail) {
        titleLabel.text = item.snippet.title
        subTitleLabel.text = item.snippet.description
        if let imageUrl = URL(string: item.snippet.thumbnails.standard.url) {
            URLSession.shared.dataTask(with: imageUrl) { [weak self] data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        self?.mediaImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        viewCountLabel.text = "觀看數量: \(item.statistics.viewCount)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: item.snippet.publishedAt) {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateLabel.text = "\(dateFormatter.string(from: date))"
        }
        likeCountLabel.text = item.statistics.likeCount
        disLikeCountLabel.text = item.statistics.dislikeCount
    }
}
