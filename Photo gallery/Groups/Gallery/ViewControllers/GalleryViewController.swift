//
//  GalleryViewController.swift
//  Photo gallery
//
//  Created by Haydar Bekmuradov on 26.05.22.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var photoUrlButton: UIButton!
    @IBOutlet weak var userUrlButton: UIButton!
    // session
    let session = URLSession.shared
    
    var names: [String] = []
    var photos : [String] = []
    
    var photoUrlArray : [String] = []
    var userUrlArray : [String] = []
    
    var new : [String] = []
    var newTwo : [String] = []

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
