//
//  CircleButton.swift
//  Scripe
//
//  Created by Khaled Bohout on 2/12/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//

import UIKit

@IBDesignable

class CircleButton: UIButton {

    @IBInspectable var cornerradius : CGFloat = 30.0 {
        didSet{
            
            setupview()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setupview()
    }
    
    func setupview(){
        layer.cornerRadius = cornerradius
    }


}
