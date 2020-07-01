//
//  ItemCell.swift
//  IBeaconNotify
//
//  Created by cntt37 on 6/18/20.
//  Copyright © 2020 hcmute.edu.vn. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var imgItem: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblLocation: UILabel!
    var item: Item? = nil {
        didSet {
            if let item = item {
                imgItem.image = Icons(rawValue: item.icon)?.image()
                lblName.text = item.name
                lblLocation.text=item.locationString()
                
            } else {
                imgItem.image = nil
                lblName.text = item?.name
            }
        }
    }
    
    func refreshLocation() {
        lblLocation.text = item?.locationString() ?? ""
    }
}
