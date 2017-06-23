//
//  LoopItem.swift
//  BULoopView
//
//  Created by Burak Üstün on 23/06/17.
//  Copyright © 2017 Burak Üstün. All rights reserved.
//

import UIKit

public class LoopItem {
    public var Name :    String?
    public var PhotoPath :     String?
    
    required public init?(_name : String, _photoPath: String){
        Name            = _name
        PhotoPath       = _photoPath
    }
}
