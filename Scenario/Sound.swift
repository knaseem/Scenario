//
//  Sound.swift
//  Scenario
//
//  Created by Khalid Naseem on 16/07/2016.
//  Copyright © 2016 Khalid Naseem. All rights reserved.
//

import Foundation

//MARK:  Create Sound Class:

class Sound {
    
    var fileName : String
    var fileExtension : String
    
    init(fileName: String, fileExtension: String) {
        
        self.fileName = fileName
        self.fileExtension = fileExtension
        
    }
    
}

//MARK:  Variable for Sound
     let beep = Sound(fileName: "beep-05", fileExtension: "mp3")
