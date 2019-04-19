//
//  ViewController.swift
//  Scripe
//
//  Created by Khaled Bohout on 2/12/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var activityspinner: UIActivityIndicatorView!
    @IBOutlet weak var transciptiontextview: UITextView!
    var aoudioplayer: AVAudioPlayer!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        activityspinner.isHidden = true
    }
    
    func requestspeachauth(){
        SFSpeechRecognizer.requestAuthorization{ auth in
            if auth == SFSpeechRecognizerAuthorizationStatus.authorized{
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
                    do{
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.aoudioplayer = sound
                        sound.play()
                    }
                    catch{print("Error")
                    }
                    let recognizer = SFSpeechRecognizer()
                    let recognitionrequst = SFSpeechURLRecognitionRequest(url : path )
                    recognizer?.recognitionTask(with: recognitionrequst){(result,erorr) in
                        if let error = erorr {
                            print("error\(error)")
                        }
                        else {
                            self.transciptiontextview.text = result?.bestTranscription.formattedString
                        }
                    }
                }
            }
        }
    }

    @IBAction func playbuttonclicked(_ sender: Any) {
        activityspinner.isHidden = false
        activityspinner.startAnimating()
        requestspeachauth()
    }
    
    
}

