//
//  UIImageView+Model.swift
//  Day
//
//  Created by Alexander Kozin on 10.06.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

//import DFImageManager

extension UIImageView {

//    func setImage(withModel model: BaseModel?) {
//        if let model = model {
//            switch model.type {
//            case .Youtube:
//                setImage(youtubeVideoId: (model as! Event).remoteObjectId)
//            default:
//                image = model.visibleImage
//            }
//        } else {
//            image = nil
//        }
//    }
//
//    @nonobjc func setImage(youtubeVideoId videoId: String?) {
//        if let videoId = videoId {
//            let urlString = "https://i.ytimg.com/vi/\(videoId)/sddefault.jpg"
//            let url = NSURL(string: urlString)
//            df_setImageWithResource(url)
//        } else {
//            image = nil
//        }
//    }
    
    func round() {
        let size = frame.size
        let radius = (size.width + size.height) / 4
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
//    func imageFrom(_ url: URL, placeholder: UIImage? = nil)
//    {        
//        let request = requestForImage(url)
//
//        self.setImageWithURLRequest(request, placeholderImage: placeholder, success: { (_, _, image) in
//            self.image = image
//            }) { (_, _, error) in
//                print(error)
//        }
//    }
}
