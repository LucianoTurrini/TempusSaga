//
//  Sound.swift
//  Tempus Saga
//
//  Created by Sidney Silva on 6/5/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit
import AVFoundation

class Sound {
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer  {
        var path = NSBundle.mainBundle().pathForResource(file as String, ofType:type as String)
        var url = NSURL.fileURLWithPath(path!)
        var error: NSError?
        var audioPlayer:AVAudioPlayer?
        audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)

        return audioPlayer!
    }
}
