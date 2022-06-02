//
//  GalleryCollectionViewCell.swift
//  Photo gallery
//
//  Created by Haydar Bekmuradov on 26.05.22.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photourlButton: UIButton!
    @IBOutlet weak var userUrlButton: UIButton!
    
    var userURL : String = " "
    var photoArray : String = " "
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
   
    func setData(user: String, photo: String){
        userURL = user
        photoArray = photo
        
        photourlButton.layer.borderWidth = 2
        photourlButton.layer.borderColor = UIColor.white.cgColor
        photourlButton.layer.cornerRadius = 10


        userUrlButton.layer.borderWidth = 2
        userUrlButton.layer.borderColor = UIColor.white.cgColor
        userUrlButton.layer.cornerRadius = 10
    }
    
    @IBAction func photoUrlButtonAction(_ sender: Any) {
        guard let url = URL(string: "\(photoArray)") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func userUrlButtonAction(_ sender: Any) {
        guard let url = URL(string: "\(userURL)") else { return }
        UIApplication.shared.open(url)
    }
}

