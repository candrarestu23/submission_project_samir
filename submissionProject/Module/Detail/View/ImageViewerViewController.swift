//
//  ImageViewerViewController.swift
//  submissionProject
//
//  Created by Candra on 2/26/24.
//

import UIKit
import SDWebImage

class ImageViewerViewController: UIViewController {

    @IBOutlet weak var fileImage: UIImageView!
    var imageURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let imageURL else { return }
        fileImage.sd_setImage(with: imageURL)
    }
}
