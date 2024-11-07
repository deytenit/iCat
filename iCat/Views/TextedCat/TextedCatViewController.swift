//
//  TextedCatViewController.swift
//  CatProject
//
//  Created by Vladimir Eremin on 11/8/24.
//

import UIKit

class TextedCatViewController: UIViewController {
    final var TEXTED_CAT_TEXT_FIELD_PLACEHOLDER = "Said nothing"
    
    @IBOutlet weak var textedCatImageView: UIImageView!
    @IBOutlet weak var textedCatTextField: UITextField!
    @IBOutlet weak var generateCatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textedCatTextField.placeholder = TEXTED_CAT_TEXT_FIELD_PLACEHOLDER
    }

    @IBAction func generateCatTouchUpInside(_ sender: UIButton) {
        generateCatButton.isEnabled = false
        
        let text = textedCatTextField.text?.isEmpty == false ? textedCatTextField.text : TEXTED_CAT_TEXT_FIELD_PLACEHOLDER

        
        fetchCat(text: text) { [weak self] data in
            guard let self = self else { return }
            
            self.generateCatButton.isEnabled = true
            
            if let data = data, let image = UIImage(data: data) {
                self.textedCatImageView.image = image
            } else {
                self.textedCatImageView.image = UIImage(named: "Cannot load the cat")
            }
        }
    }

}

