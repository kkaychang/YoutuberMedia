//
//  LoginViewController.swift
//  YoutuberMedia
//
//  Created by Kay Chang on 2021/4/24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clickToVisitWebLink(_ sender: UIButton) {
        var urlPath: String = ""
        
        switch sender.restorationIdentifier {
        case "FbLink":
            urlPath = "https://www.facebook.com/winnstock/"
        case "YoutubeChannelLink":
            urlPath = "https://www.youtube.com/channel/UCvnLmiWt_zIVIh0zUm_j4Hw"
        default:
            ()
        }
        
        guard let url = URL(string: urlPath) else { return }
        displayEmbedSafariViewController(url: url)
    }
}
