//
//  UIView+Image.swift
//  Drawtastic
//
//  Created by Andy Reyes on 5/20/15.
//  Copyright (c) 2015 Andy Reyes. All rights reserved.
//

extension UIView {
    
    // Any view can now generate an image of itself
    var image: UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0 /*UIScreen.mainScreen().scale*/);
        self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        let snapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return snapshotImage;
    }
    
    // A function I'm going to need in the future.
    // Putting it here temporarily until I think of a good place to put it
    // TODO: Why does quality degrade when joining images?
    static func joinImages(images: [UIImage]) -> UIImage {
        
        var totalSize = CGSizeZero
        
        for image in images {
            totalSize.height += image.size.height
            
            // Total width should only be as wide as the largest image width
            if image.size.width > totalSize.width {
                totalSize.width = image.size.width
            }
            
        }
        
        UIGraphicsBeginImageContextWithOptions(totalSize, false, 0 /*UIScreen.mainScreen().scale*/)
        
        var imagePoint = CGPointZero
        
        for image in images {
            image.drawAtPoint(imagePoint)
            imagePoint.y += image.size.height
        }
        
        let finalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return finalImage
    }
}
