//
//  PlainCatViewController.swift
//  CatProject
//
//  Created by Vladimir Eremin on 11/8/24.
//

import UIKit

class PlainCatViewController: UIViewController {
    @IBOutlet weak var plainCatImageView: UIImageView!
    @IBOutlet weak var generateCatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func generateCatTouchUpInside(_ sender: UIButton) {
        generateCatButton.isEnabled = false

        fetchCat { [weak self] data in
            guard let self = self else { return }
            
            self.generateCatButton.isEnabled = true
            
            if let data = data, let image = UIImage(data: data) {
                self.plainCatImageView.image = image
            } else {
                self.plainCatImageView.image = UIImage(named: "Cannot load the cat")
            }
        }
    }
}
