//
//  IconCell.swift
//  IBeaconNotify
//
//  Created by cntt37 on 6/18/20.
//  Copyright © 2020 hcmute.edu.vn. All rights reserved.
//

import UIKit

class IconCell: UICollectionViewCell {
    
    @IBOutlet weak var imgIconCell: UIImageView!
    
    var icon: Icons?{
        didSet{
            guard let icon = icon else {return}
            imgIconCell.image=icon.image()
        }
    }
}
