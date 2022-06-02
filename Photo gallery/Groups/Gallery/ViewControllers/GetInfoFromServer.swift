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
 
                let userNames = json.values.map { $0.userName }
                var elementsKeys = zip(userNames, json.keys).map { ($0, $1) }
                elementsKeys.sort { $0.0 < $1.0 }
                for i in elementsKeys {
                    self.names.append(i.0)
                    self.photos.append(i.1)
                }

                let photosUrl = json.values.map { $0.photoURL }
                var elementsPhotosUrl = zip(userNames, photosUrl).map { ($0, $1) }
                elementsPhotosUrl.sort { $0.0 < $1.0 }

                for i in elementsPhotosUrl {
                    self.photoUrlArray.append(i.1)
                }

                let usersUrl = json.values.map { $0.userURL }
                var elementsUserssUrl = zip(userNames, usersUrl).map { ($0, $1) }
                elementsUserssUrl.sort { $0.0 < $1.0 }
                
                for i  in elementsUserssUrl {
                    self.userUrlArray.append(i.1)
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
