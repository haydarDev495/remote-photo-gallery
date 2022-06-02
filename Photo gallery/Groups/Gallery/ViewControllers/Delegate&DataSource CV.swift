//
//  Delegate&DataSource CV.swift
//  Photo gallery
//
//  Created by Haydar Bekmuradov on 1.06.22.
//

import Foundation
import UIKit

// MARK: -
// MARK: - Configure CollectiovView Data Source
extension GalleryViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionViewCell", for: indexPath) as! GalleryCollectionViewCell
        cell.backgroundImageView.downloaded(from: "https://dev.bgsoft.biz/task/\(photos[indexPath.row]).jpg")
        cell.backgroundImageView.contentMode = .scaleAspectFill
        cell.userNameLabel.text = names[indexPath.row]
        cell.setData(user: userUrlArray[indexPath.row], photo: photoUrlArray[indexPath.row])
        
        return cell
    }
}

// MARK: -
// MARK: - Configure CollectiovView Delegate
extension GalleryViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds.size
        return screenSize
    }
}
