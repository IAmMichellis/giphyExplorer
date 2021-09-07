//
//  UIImageView+loadUrl.swift
//  GiphyExplorer
//
//  Created by Michelle Ellis on 2021-09-03.
//

import UIKit

private var associateKey: Void?

extension UIImageView {
    func loadUrl(from url: URL) {
        objc_setAssociatedObject(self, &associateKey, url.absoluteString, .OBJC_ASSOCIATION_RETAIN)
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                let imageUrl = objc_getAssociatedObject(self!, &associateKey) as? String
                if imageUrl == httpURLResponse.url?.absoluteString {
                    self?.image = image
                }
            }
        }.resume()
    }
    func loadUrl(from link: String) {
        guard let url = URL(string: link) else { return }
        loadUrl(from: url)
    }
}
