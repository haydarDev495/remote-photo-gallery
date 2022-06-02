//
//  GetInfoFromServer.swift
//  Photo gallery
//
//  Created by Haydar Bekmuradov on 1.06.22.
//

import Foundation
import UIKit

// MARK: -
// MARK: - Configure
extension GalleryViewController {
    
    func configure() {
        configureCollectionViewCell()
        getInfoFromServer()
    }
    
    func getInfoFromServer() {
        
        guard let url = URL(string: "https://dev.bgsoft.biz/task/") else { return }
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(InfoTypeAlias.self, from: data)
                                
                for i  in json.values {
                    self.names.append(i.userName)
                    self.photoUrlArray.append(i.photoURL)
                    self.userUrlArray.append(i.userURL)
                }
                
                for i in json.keys {
                    self.photos.append(i)
                }
                
            } catch {
                return
            }
        }
        task.resume()
    }
    
    func configureCollectionViewCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
