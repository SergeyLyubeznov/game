//
//  UIImage + Utils.swift
//  Bunch-iOS
//
//  Created by Sergey Lyubeznov on 12/09/16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit
import CoreImage
import CoreGraphics

extension UIImage {
    
    func blurImageRadius(_ blurRadius:CGFloat) -> UIImage?
    {
        let blur = CIFilter(name: "CIGaussianBlur")
        
        blur!.setValue(CoreImage.CIImage(image: self), forKey: kCIInputImageKey)
        blur!.setValue(blurRadius, forKey: kCIInputRadiusKey)
        
        let ciContext  = CIContext(options: nil)
        
        let result = blur!.value(forKey: kCIOutputImageKey) as! CoreImage.CIImage!
        
        let sise = self.size
        let scale = self.scale
    
        let boundingRect = CGRect(x:0,
                                  y: 0,
                                  width: sise.width * scale,
                                  height: sise.height * scale)
        
        let cgImage = ciContext.createCGImage(result!, from: boundingRect)
        
        let filteredImage = UIImage(cgImage: cgImage!)
        
        return filteredImage
    }
    
    /// Returns a image that fills in newSize
    func resizedImage(_ newSize: CGSize) -> UIImage {
        // Guard newSize is different
        guard self.size != newSize else { return self }
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    /// Returns a resized image that fits in rectSize, keeping it's aspect ratio
    /// Note that the new image size is not rectSize, but within it.
    func resizedImageWithinRect(_ rectSize: CGSize) -> UIImage {
        let widthFactor = size.width / rectSize.width
        let heightFactor = size.height / rectSize.height
        
        var resizeFactor = widthFactor
        if size.height > size.width {
            resizeFactor = heightFactor
        }
        
        let newSize = CGSize(width: size.width/resizeFactor, height: size.height/resizeFactor)
        let resized = resizedImage(newSize)
        return resized
    }
    
    func textToImage(_ drawText: NSString, inImage: UIImage, atPoint: CGPoint) -> UIImage{
        
        // Setup the font specific variables
        let textColor = UIColor.white
        let textFont = UIFont(name: "Helvetica Bold", size: 12)!
        
        // Setup the image context using the passed image
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(inImage.size, false, scale)
        
        // Setup the font attributes that will be later used to dictate how the text should be drawn
        let textFontAttributes = [
            NSFontAttributeName: textFont,
            NSForegroundColorAttributeName: textColor,
            ]
        
        // Put the image into a rectangle as large as the original image
        inImage.draw(in: CGRect(x: 0, y: 0, width: inImage.size.width, height: inImage.size.height))
        
        // Create a point within the space that is as bit as the image
        let rect = CGRect(x: atPoint.x, y: atPoint.y, width: inImage.size.width, height: inImage.size.height)
        
        // Draw the text into an image
        drawText.draw(in: rect, withAttributes: textFontAttributes)
        
        // Create a new image out of the images we have created
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // End the context now that we have the image we need
        UIGraphicsEndImageContext()
        
        //Pass the image back up to the caller
        return newImage!
        
    }
}
