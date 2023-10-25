//
//  ImageCollectionViewCell.swift
//  Equilibrium
//
//  Created by Vlad on 14.9.23..
//

import UIKit



class ImageViewCell: UICollectionViewCell {

    @IBOutlet weak var imageViewCell: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageViewCell.image = nil
    }
}
