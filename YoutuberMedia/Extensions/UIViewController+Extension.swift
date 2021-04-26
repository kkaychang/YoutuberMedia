//
//  UIViewController+Extension.swift
//  YoutuberMedia
//
//  Created by Kay Chang on 2021/4/24.
//

import Foundation
import UIKit

extension UIViewController {
    func displayEmbedSafariViewController(url: URL) {
        let safariViewController = EmbedSafariViewController(url: url)
        safariViewController.modalPresentationStyle = .fullScreen
        present(safariViewController, animated: true, completion: nil)
    }
}
