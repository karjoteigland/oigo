//
//  PageView.swift
//  Oigo
//
//  Created by Karl Johan Teigland on 04/05/2017.
//  Copyright © 2017 Karl Johan Teigland. All rights reserved.
//

import UIKit

class PageView: UIView {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secondLabel: UILabel!

    class func loadFromNib() -> PageView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "PageView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! PageView
        return view
    }
    
    
    func configure(data: [String: String]) {
        label.text = data["title"]
        secondLabel.text = data["subTitle"]
        let image = UIImage(named: data["image"]!)
        imageView.image = image
    }
    
}












