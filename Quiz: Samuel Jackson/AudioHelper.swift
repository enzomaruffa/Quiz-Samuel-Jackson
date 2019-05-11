//
//  AudioHelper.swift
//  Quiz: Samuel Jackson
//
//  Created by Enzo Maruffa Moreira on 10/05/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import Foundation
import AVFoundation

class AudioHelper {
    
    var player: AVAudioPlayer?
    
    let rightSounds = ["selfesteem"]
    let wrongSounds = ["youcantsayno"]
    
    func playSound(right: Bool) {
        let name = right ? rightSounds.shuffled().first! : wrongSounds.shuffled().first!
        print("playing", name)
        
        guard let url = Bundle.main.url(forResource: "sounds/" + name, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
